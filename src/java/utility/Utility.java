/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author Stark
 */
public class Utility {

    public static Connection openConnection(String sqldb) {
        Connection con;
        String sqlusername = "root";
        String sqlpassword = "root";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + sqldb, sqlusername, sqlpassword);
           
            return con;
        } catch (ClassNotFoundException ex) {
            return null;
        } catch (SQLException ex) {
            return null;
        }
    }
    public static ArrayList<ResultSet> fetchResultSubjectDetail(String yop, String semester, String dept) {

        ArrayList<ResultSet> detail = new ArrayList<ResultSet>();
        String db = "college_" + dept;
        
        Connection con = openConnection(db);
        if (con == null) {
            return null;
        }
        Statement stat;
        ResultSet rs;
        try {
            String sql = "select name,enrollment from student_details where yop='" + yop + "' " ;
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            detail.add(rs);
            sql = "select subject from subjects where yop='" + yop + "' AND semester='" + semester + "'";
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            detail.add(rs);
            return detail;
        } catch (SQLException e) {
            System.out.print(e);
            return null;
        }
    }
    public static ResultSet getInfo(String yop,String dept) throws SQLException, ClassNotFoundException{
        String db = "college_"+dept;
        Connection con=openConnection(db);
        
        PreparedStatement ps=con.prepareStatement("select name,enrollment from student_details where yop=?");
        ps.setString(1,yop);
        
        ResultSet rs = ps.executeQuery();
        return rs;
       
    }
    public static boolean feedAttendance(String dept,String eno,String yop,String sem,String month,int attd) throws SQLException{
       String db = "college_" + dept;
        
        Connection con = openConnection(db);
        if (con == null) {
            return false;
        } 
        Statement stat=con.createStatement();
        String sql="update attendance set attd ="+attd+" where eno='"+eno+"' AND yop='"+yop+"' AND sem='"+sem+"' AND month='"+month+"'";
        stat.executeUpdate(sql);
        return true;
    }
    public static ArrayList<ResultSet> fetchIndividualDetail(String eno,String yop, String semester, String dept) {

        ArrayList<ResultSet> detail = new ArrayList<ResultSet>();
        String db = "college_" + dept;
        
        Connection con = openConnection(db);
        if (con == null) {
            return null;
        }
        Statement stat;
        ResultSet rs;
        try {
            String sql = "select name,enrollment from student_details where yop='" + yop + "' AND enrollment='"+eno+"'";
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            detail.add(rs);
            sql = "select subject from subjects where yop='" + yop + "' AND semester='" + semester + "'";
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            detail.add(rs);
            return detail;
        } catch (SQLException e) {
            System.out.print(e);
            return null;
        }
    }

    public static ArrayList<String> fetchDetail(String yop, String semester, int offset, String dept) {

        ArrayList<String> detail = new ArrayList<String>();
        String db = "college_" + dept;
        System.out.println(offset);
        Connection con = openConnection(db);
        if (con == null) {
            return null;
        }
        Statement stat;
        ResultSet rs;
        try {
            String sql = "select name,enrollment from student_details where yop='" + yop + "' limit 1 offset " + offset;
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            while (rs.next()) {
                detail.add(rs.getString("name"));
                detail.add(rs.getString("enrollment"));
                sql = "select subject from subjects where yop='" + yop + "' AND semester='" + semester + "'";
                stat = con.createStatement();
                rs = stat.executeQuery(sql);
                while (rs.next()) {
                    detail.add(rs.getString("subject"));
                }
                if(detail.size()==7)
                    return detail;
            }
            return null;
        } catch (SQLException e) {
            System.out.print(e);
            return null;
        }
    }
    public static boolean feedDetail(String sql, String dept) {
        try {
            String db = "college_" + dept;
            Connection con = openConnection(db);
            if (con == null) {
                return false;
            }
            Statement stat = con.createStatement();
            
            stat.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
    public static boolean initAttendance(String dept,String yop,String month,String sem,int count) throws SQLException{
        String db = "college_" + dept;
        Connection con = openConnection(db);
        if (con == null) {
            return false;
        }
        // initialize lecture count for given month
        PreparedStatement ps=con.prepareStatement("insert into attendance_lecture_count values(?,?,?,?)");
        ps.setString(1, yop);
        ps.setString(2,sem);
        ps.setString(3,month);
        ps.setInt(4, count);
        int i=ps.executeUpdate();
        if(i==0)
        {
            System.out.println(i);
            return false;
        }
        // insert entries into main attendance table from student details
        ps=con.prepareStatement("select enrollment from student_details where yop=?");
        ps.setString(1,yop);
        ResultSet rs=ps.executeQuery();
        if(rs==null)return false;
        while(rs.next()){
            ps=con.prepareStatement("insert into attendance(eno,yop,sem,month) values(?,?,?,?)");
            ps.setString(1,rs.getString(1));
            ps.setString(2,yop );
            ps.setString(3,sem );
            ps.setString(4,month);
            
            int j=ps.executeUpdate();
            if (j==0)return false;
         }
        con.close();
        return true;
        
    }
     public static boolean updateResult(String sql, String dept) {
        try {
            String db = "college_" + dept;
            Connection con = openConnection(db);
            if (con == null) {
                return false;
            }
            Statement stat = con.createStatement();
            int i=stat.executeUpdate(sql);
            if(i>0)
            return true;
            
            return false;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
     public static ResultSet fetchResults(String sem,String batch,String dept) {

        String db = "college_" + dept;
        Connection con = openConnection(db);
        if (con == null) {
            return null;
        }
        Statement stat;
        ResultSet rs;
        String sql = "select * from result_analysis where yop='" + batch + "' && semester='" + sem +"'";
        try {
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            return rs;

        } catch (SQLException ex) {
            return null;
        }
    }
     public static ResultSet fetchIndividualResults(String eno,String sem,String batch,String dept) {

        String db = "college_" + dept;
        Connection con = openConnection(db);
        if (con == null) {
            return null;
        }
        Statement stat;
        ResultSet rs;
        String sql = "select * from result_analysis where yop='" + batch + "' and semester='" + sem +"' and enrollment='" + eno +"'";
        try {
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            return rs;

        } catch (SQLException ex) {
            return null;
        }
    }
    public static boolean checkLogin(String userid, String password, String role, String dept) {

        String db = "college_" + dept;
        Connection con = openConnection(db);
        if (con == null) {
            return false;
        }
        Statement stat;
        ResultSet rs;
        String sql = "select * from user_login where userid='" + userid + "' && password='" + password + "' && role='" + role + "'";
        try {
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            return rs.next();

        } catch (SQLException ex) {
            return false;
        }
    }

    public static boolean createNewBatch(String dept, String filename) {
        try {
            FileInputStream file = new FileInputStream(new File(filename));
            Connection con = Utility.openConnection("college_" + dept);
            Statement stat = con.createStatement();
            //Get the workbook instance for XLS file 
            HSSFWorkbook workbook = new HSSFWorkbook(file);
            //Get first sheet from the workbook
            HSSFSheet sheet = workbook.getSheetAt(0);
            //Iterate through each rows from first sheet
            Iterator<Row> rowIterator = sheet.iterator();
            Row row = rowIterator.next();
            System.out.println();
            while (rowIterator.hasNext()) {
                row = rowIterator.next();

                //For each row, iterate through each columns
                Iterator<Cell> cellIterator = row.cellIterator();
                ArrayList<String> list = new ArrayList<String>();
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    switch (cell.getCellType()) {

                        case Cell.CELL_TYPE_BLANK:
                            list.add("NA");
                            break;
                        case Cell.CELL_TYPE_NUMERIC:
                            Long d = (long) cell.getNumericCellValue();
                            list.add(d.toString());
                            break;
                        case Cell.CELL_TYPE_STRING:
                            list.add(cell.getStringCellValue());
                            break;
                    }
                }
                System.out.print(list.size());
                String sql = "insert into student_details values('" + list.get(0) + "','" + list.get(1) + "','" + list.get(2) + "','" + list.get(3) + "','" + list.get(4) + "','" + list.get(5) + "','" + list.get(6) + "','" + list.get(7) + "','" + list.get(8) + "','" + list.get(9) + "','" + list.get(10) + "','" + list.get(11) + "','" + list.get(12) + "','" + list.get(13) + "','" + list.get(14) + "','" + list.get(15) + "','" + list.get(16) + "','" + list.get(17) + "','" + list.get(18) + "','" + list.get(19) + "','" + list.get(20) + "','xyz','" + list.get(21) + "')";
                stat.executeUpdate(sql);
                
            }
            file.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

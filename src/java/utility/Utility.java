/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
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
    public static Connection openConnection(String sqldb){
        Connection con;
        String sqlusername="root";
        String sqlpassword="root";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+sqldb,sqlusername ,sqlpassword);
            return con;
        } catch (Exception ex) {
            return null;
        }
    }
    
    public static boolean checkLogin(String userid, String password,String role,String dept){
        
        String db = "college_"+dept;
        Connection con = openConnection(db);
        Statement stat;
        ResultSet rs;
        String sql = "select * from user_login where userid='"+userid+"' && password='"+password+"' && role='"+role+"'";
        try {
            stat = con.createStatement();
            rs = stat.executeQuery(sql);
            if(rs.next())
                return true;
            
        } catch (SQLException ex) {
            return false;
        }
        return false;
    }
    
    public static boolean createNewBatch(String dept, String filename){
    try { 
    FileInputStream file = new FileInputStream(new File(filename));
    Connection con = Utility.openConnection("college_"+dept);
    Statement stat = con.createStatement();
    //Get the workbook instance for XLS file 
    HSSFWorkbook workbook = new HSSFWorkbook(file);
    //Get first sheet from the workbook
    HSSFSheet sheet = workbook.getSheetAt(0);
    //Iterate through each rows from first sheet
    Iterator<Row> rowIterator = sheet.iterator();
    Row row = rowIterator.next();
    System.out.println();
    while(rowIterator.hasNext()) {
        row = rowIterator.next();
        
        //For each row, iterate through each columns
        Iterator<Cell> cellIterator = row.cellIterator();
        ArrayList<String> list = new ArrayList<String>();
        while(cellIterator.hasNext()) {
            Cell cell = cellIterator.next();
            switch(cell.getCellType()) {
                
                case Cell.CELL_TYPE_BLANK:
                    list.add("NA");
                    break;
                case Cell.CELL_TYPE_NUMERIC:
                    Long d = (long)cell.getNumericCellValue();
                    list.add(d.toString());
                    break;
                case Cell.CELL_TYPE_STRING:
              list.add(cell.getStringCellValue());
                    break;
            }
        }
        System.out.print(list.size());
        String sql= "insert into student_details values('"+list.get(0)+"','"+list.get(1)+"','"+list.get(2)+"','"+list.get(3)+"','"+list.get(4)+"','"+list.get(5)+"','"+list.get(6)+"','"+list.get(7)+"','"+list.get(8)+"','"+list.get(9)+"','"+list.get(10)+"','"+list.get(11)+"','"+list.get(12)+"','"+list.get(13)+"','"+list.get(14)+"','"+list.get(15)+"','"+list.get(16)+"','"+list.get(17)+"','"+list.get(18)+"','"+list.get(19)+"','"+list.get(20)+"','xyz','"+list.get(21)+"')";
        stat.executeUpdate(sql);
        System.out.println("");
    }
    file.close();
   return true;  
} catch (Exception e) {
   e.printStackTrace();
   return false;
    }
}
}

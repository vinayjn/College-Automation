/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utility.Utility;

/**
 *
 * @author Stark
 */
public class PInvalidateBatch extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String department = request.getParameter("dept");
        String yop = request.getParameter("yop");
        try {
            Connection con = Utility.openConnection("college_" + department);
            String table = "bkp_" + yop;
            String sql = "CREATE TABLE `" + table + "_student_details` ("
                    + "  `enrollment` varchar(20) NOT NULL,"
                    + "  `computer_code` varchar(20) DEFAULT NULL,"
                    + "  `name` varchar(50) DEFAULT NULL,"
                    + "  `gender` varchar(20) DEFAULT NULL,"
                    + "  `category` varchar(50) DEFAULT NULL,"
                    + "  `address` varchar(150) DEFAULT NULL,"
                    + "  `mobile_number` varchar(50) DEFAULT NULL,"
                    + "  `phone_number` varchar(50) DEFAULT NULL,"
                    + "  `parent_mobile` varchar(50) DEFAULT NULL,"
                    + "  `father_name` varchar(50) DEFAULT NULL,"
                    + "  `mother_name` varchar(50) DEFAULT NULL,"
                    + "  `local_guardian` varchar(50) DEFAULT NULL,"
                    + "  `local_guardian_number` varchar(50) DEFAULT NULL,"
                    + "  `emailid` varchar(50) DEFAULT NULL,"
                    + "  `dob` varchar(50) DEFAULT NULL,"
                    + "  `blood_group` varchar(50) DEFAULT NULL,"
                    + "  `10th` varchar(50) DEFAULT NULL,"
                    + "  `12th` varchar(50) DEFAULT NULL,"
                    + "  `diploma` varchar(50) DEFAULT NULL,"
                    + "  `qualifying_exam` varchar(50) DEFAULT NULL,"
                    + "  `qualifying_exam_marks` varchar(50) DEFAULT NULL,"
                    + "  `photo` varchar(50) DEFAULT NULL,`yop` varchar(5) NOT NULL,"
                    + "  PRIMARY KEY (`enrollment`)"
                    + ")";
            PreparedStatement ps = null;
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            sql = "select * from student_details where yop='" + yop + "'";
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            sql = "insert into " + table + "_student_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            while (rs.next()) {
                for (int i = 1; i <= 23; i++) {
                    ps.setString(i, rs.getString(i));
                }
                ps.executeUpdate();
            }
            sql ="insert into alumini(enrollment,name,yop,current_org,designation) select enrollment,name,yop,'','',,emailid where yop='" + yop + "'";
            sql = "delete from student_details where yop='" + yop + "'";
            ps = con.prepareStatement(sql);
            int i = ps.executeUpdate();
            sql ="insert into alumini ";
            if (i > 0) {
                session.setAttribute("msg", "1");
                session.setAttribute("records", new Integer(i).toString());
                response.sendRedirect("invalidateBatch.jsp");
            } else {
                session.setAttribute("msg", "0");
                response.sendRedirect("invalidateBatch.jsp");
            }
        } catch (SQLException ex) {
            out.print(ex);
        }

    }
}

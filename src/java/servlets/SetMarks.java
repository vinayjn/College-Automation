/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
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
public class SetMarks extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sb1 = request.getParameter("sb1");
        String sb2 = request.getParameter("sb2");
        String sb3 = request.getParameter("sb3");
        String sb4 = request.getParameter("sb4");
        String sb5 = request.getParameter("sb5");
        HttpSession session = request.getSession();
        String dept = (String) session.getAttribute("dept");
        String semester = (String) session.getAttribute("semester");
        String yop = (String) session.getAttribute("yop");
        Connection con = Utility.openConnection("college_" + dept);
        try {
            Statement stat = con.createStatement();

            String sql = "update mst_result_analysis set "
                    + "max_one='" + sb1
                    + "',max_two='" + sb2
                    + "',max_three='" + sb3
                    + "',max_four='" + sb4
                    + "',max_five='" + sb5
                    + "' where semester='" + semester
                    + "' AND yop='" + yop + "'";
            int i = stat.executeUpdate(sql);
            System.out.println("Worked : "+i);
            if(i>0)
                response.sendRedirect("setMaxMarks.jsp?msg=1");
        } catch (SQLException ex) {
            System.out.println("Caught in catch");
            System.out.println(ex);
            response.sendRedirect("setMaxMarks.jsp?msg=0");
        }
    }
}

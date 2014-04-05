/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class PManageFaculty extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out= response.getWriter();
        HttpSession session = request.getSession();
        if (request.getParameter("add") != null) {          //when add button is clicked
            String department = request.getParameter("dept");
            String uid = request.getParameter("userid");
            String fname = request.getParameter("name");
            String dob = request.getParameter("dob");
            String bloodgroup = request.getParameter("bloodgroup");
            String pancard = request.getParameter("pancard");
            String voterid = request.getParameter("voterid");
            String emailid = request.getParameter("emailid");
            String contactno = request.getParameter("contactno");
            String address = request.getParameter("address");
            String qualification = request.getParameter("qualification");
            String experience = request.getParameter("experience");
            String doj = request.getParameter("doj");
            String dol = "NA"; //Since date of leaving is unknown
            String designation = request.getParameter("designation");
            String bankacc = request.getParameter("bankacc");
            String bankname = request.getParameter("bankname");
            String ifsc = request.getParameter("ifsc");
            try {
                Connection con = Utility.openConnection("college_" + department);
                
                //save userid and password in user_login table
                String sql = "insert into user_login values (?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, uid);
                ps.setString(2, "password");
                ps.setString(3, "faculty");
                ps.setString(4, department);
                ps.executeUpdate();
                
                //save faculty details in faculty_details table
                sql = "insert into faculty_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                ps=con.prepareStatement(sql);
                ps.setString(1, uid);
                ps.setString(2, fname);
                ps.setString(3, emailid);
                ps.setString(4, contactno);
                ps.setString(5, address);
                ps.setString(6, doj);
                ps.setString(7, dol);
                ps.setString(8, dob);
                ps.setString(9, bloodgroup);
                ps.setString(10, voterid);
                ps.setString(11, pancard);
                ps.setString(12, qualification);
                ps.setString(13, experience);
                ps.setString(14, bankname);
                ps.setString(15, bankacc);
                ps.setString(16, ifsc);
                ps.setString(17, designation);
                ps.executeUpdate();
                session.setAttribute("msg", "1");
                response.sendRedirect("manageFaculties.jsp");
            } catch (Exception e) {
                session.setAttribute("msg", "0");
                response.sendRedirect("manageFaculties.jsp");
            }
        } else if (request.getParameter("edit") != null) {  //when edit button is clicked
            String department = request.getParameter("dept");
            String uid = request.getParameter("userid");
            session.setAttribute("msg", "1");
            response.sendRedirect("manageFaculties.jsp");
        } else {                                                //when delete button is clicked
            String department = request.getParameter("dept");
            String uid = request.getParameter("userid");
            session.setAttribute("msg", "1");
            response.sendRedirect("manageFaculties.jsp");
        }
    }
}

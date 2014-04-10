/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
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
public class login extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
        String dept = request.getParameter("dept");
        String role = request.getParameter("role");
        boolean status = Utility.checkLogin(userid, password,role,dept);
        System.out.println("Login.java Status from datavase : "+status);
        HttpSession session = request.getSession();
        if(status){
            session.setAttribute("userid", userid);
            session.setAttribute("role", role);
            session.setAttribute("dept", dept);
            response.sendRedirect("./home.jsp");
        }
        else{
            System.out.println("Else Returned message 0");
            response.sendRedirect("./index.jsp?msg=0");
            
        }
    }
}

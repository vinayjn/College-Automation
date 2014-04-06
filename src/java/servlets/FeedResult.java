/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class FeedResult extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String yop = request.getParameter("yop");
        String semester = request.getParameter("semester");
        HttpSession session = request.getSession();
        ArrayList<String> detail ;
        String dept = (String)session.getAttribute("dept");
        int offset = (Integer)session.getAttribute("offset");
        detail = Utility.fetchDetail(yop,semester,offset,dept);
        out.println(detail.get(0));
        out.println(detail.get(1));
        out.println(detail.get(2));
        out.println(detail.get(3));
        out.println(detail.get(4));
        out.println(detail.get(5));
        out.println(detail.get(6));
    }


}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
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
public class PMstQuestionPapers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        final int permitedSize = 314572800;
        HttpSession session = request.getSession();
        try {
        String dept = (String)session.getAttribute("dept");
        Connection con = Utility.openConnection("college_"+dept);
        Statement stat = con.createStatement();
        String sql;
        String uploadPath = request.getRealPath("//files//MST Question Papers//");
        MultipartRequest multi;
        multi = new MultipartRequest(request, uploadPath, permitedSize, new DefaultFileRenamePolicy());
        String filename=null;   
        ArrayList<String> myparams = new ArrayList<String>();
        Enumeration params = multi.getParameterNames();
        int i=0;
        while (params.hasMoreElements()) {
        String name = (String)params.nextElement();
        System.out.println("Parameter "+ i +": "+ multi.getParameter(name));
        myparams.add(multi.getParameter(name));
        i++;
        }
        
        /*
         Parameter 0: Year: 2
         Parameter 1: Sem: 5
         Parameter 2: April
         */
        Enumeration files = multi.getFileNames(); 
        while (files.hasMoreElements()) 
          { 
                 String name = (String)files.nextElement();
                 String type = multi.getContentType(name); 
                 filename = multi.getFilesystemName(name); 
                 //String extension = filename.substring(((filename.lastIndexOf("."))), filename.length()) ;
                 File currentFile = multi.getFile(name);
                 if(currentFile == null) {
                      System.out.println("There is no file selected!");
                      return;
                    }
                     sql = "insert into midsem_question_paper values('"+myparams.get(0)+"','"+myparams.get(1)+"','"+myparams.get(2)+"','"+filename+"')";
                     stat.executeUpdate(sql);
                     session.setAttribute("msg", "1");
                     response.sendRedirect("mstQuestionPapers.jsp");
          }  
        } catch (Exception ex) {
            session.setAttribute("msg", "0");
            response.sendRedirect("mstQuestionPapers.jsp");
        }
    
    }


}


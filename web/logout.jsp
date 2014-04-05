<%-- 
    Document   : logout
    Created on : Feb 2, 2014, 11:19:45 PM
    Author     : Vinay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

   session = request.getSession(false);
   if(session.getAttribute("userid")==null)
       response.sendRedirect("index.jsp");
   else{
       session.invalidate();
       response.sendRedirect("index.jsp");
   }
%>

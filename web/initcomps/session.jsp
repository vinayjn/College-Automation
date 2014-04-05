<%
    session = request.getSession(false);
    String userid = (String)session.getAttribute("userid");
    String dept = (String)session.getAttribute("dept");
    String role = (String)session.getAttribute("role");
    if(userid==null||dept==null||role==null){
        response.sendRedirect("index.jsp?session=0");
    }
%>
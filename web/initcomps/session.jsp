<%
    session = request.getSession(false);
    String userid = (String)session.getAttribute("userid");
    String department = (String)session.getAttribute("dept");
    String roles = (String)session.getAttribute("role");
    if(userid==null||department==null||roles==null){
        response.sendRedirect("index.jsp?session=0");
    }
%>
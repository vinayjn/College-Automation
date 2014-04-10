
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utility.Utility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <%@include file="initcomps/navbar.jsp" %>
          <%         
                    String semester = request.getParameter("semester");
                    String sb1 = request.getParameter("sb1");
                    String sb2 = request.getParameter("sb2");
                    String sb3 = request.getParameter("sb3");
                    String sb4 = request.getParameter("sb4");
                    String sb5 = request.getParameter("sb5");
                    String atkt=request.getParameter("atkt");
                    String enrollment = request.getParameter("enrollment");
                    String cgpa=request.getParameter("cgpa");
                    String sgpa=request.getParameter("sgpa");
                    String sql = "update result_analysis set subject_one='"+sb1+
                            "',subject_two='"+sb2+
                            "',subject_three='"+sb3+
                            "',subject_four='"+sb4+
                            "',subject_five='"+sb5+
                            "',cgpa='"+cgpa+
                            "',sgpa='"+sgpa+
                            "',atkt='"+atkt+
                            "' where enrollment='"+enrollment+
                            "' AND semester='"+semester+"'"; 
                    boolean status = Utility.updateResult(sql, session.getAttribute("dept").toString());
                    if(status){
                    out.println("<h2>Update Successfull. <a href='updateResult.jsp'>Update More</a> </h2>");
                    }
                    else{
                       out.println("<h2>Some Error Occured!!! <a href='updateResult.jsp'>Try Again</a> </h2>"); 
                    }
                    %>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

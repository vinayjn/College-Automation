
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
              String department=session.getAttribute("dept").toString();
              String yop,sem,month;
              int lec_count;
              yop=request.getParameter("yop");
              sem=request.getParameter("sem");
              month=request.getParameter("month");
              lec_count=Integer.parseInt(request.getParameter("count"));
              boolean status=Utility.initAttendance(department, yop, month, sem, lec_count);
              if(status){
               
              %>
              <form id="init_values" action="feedAttdRecords.jsp">
               <input type="hidden" name="yop" value="<%=yop%>"/>
               <input type="hidden" name="sem" value="<%=sem%>"/>
               <input type="hidden" name="month" value="<%=month%>"/>
               <input type="hidden" name="department" value="<%=department%>"/>
               <input type="hidden" name="pointer" value="1"/>
              </form>
              <script type="text/javascript">
               document.getElementById("init_values").submit();
              </script>

              <%
              }
              else out.println("<h2>Error in Initialization!!! <a href='feedAttendance.jsp'>Try Again</a></h2>");
            
            %>
            
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

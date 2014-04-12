

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
            String yop,sem,department,month,eno;
            int pointer=Integer.parseInt(request.getParameter("pointer"));
            yop=request.getParameter("yop");
            sem=request.getParameter("sem");
            month=request.getParameter("month");
            department=request.getParameter("department");
            eno=request.getParameter("eno");
            int attd=Integer.parseInt(request.getParameter("attd"));
            
            boolean status=Utility.feedAttendance(department, eno, yop, sem, month, attd);
            if(status){
            
            %>
            <form action="feedAttdRecords.jsp" method="POST" id="init_param">
               
                        <!-- Hidden Values-->
                        
                        <input type="hidden" name="yop" value="<%=yop%>"/>
                        <input type="hidden" name="sem" value="<%=sem%>"/>
                        <input type="hidden" name="month" value="<%=month%>"/>
                        <input type="hidden" name="department" value= "<%=department%>"/>
                        <input type="hidden" name="pointer" value="<%=pointer%>"/>
                        
                    

                
            </form>
             <script type="text/javascript">
               document.getElementById("init_param").submit();
              </script>  
              <%
              }
            else{out.print("Failed to Update!! <h3><a href='feedAttdRecords.jsp'>Try Again</a></h3>");}
              %>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

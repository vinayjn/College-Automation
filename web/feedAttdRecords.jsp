
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
            String yop,sem,department,month;
            String name=null,eno=null;
            int pointer=Integer.parseInt(request.getParameter("pointer"));
           
            yop=request.getParameter("yop");
            sem=request.getParameter("sem");
            month=request.getParameter("month");
            department=request.getParameter("department");
             System.out.println(department);
            ResultSet rs=Utility.getInfo(yop, department),temp;
            temp=rs;
            temp.last();
            int total=temp.getRow();
            temp.beforeFirst();
            System.out.println(total+"-->"+pointer);
           
            if(rs.isBeforeFirst()){
                if(total<pointer)
                {
                    response.sendRedirect("attdFeedComplete.jsp");
                }
                else{
                rs.absolute(pointer);
                pointer++;
            
            eno=rs.getString("enrollment");
            name=rs.getString("name");
            %>
              <form class="form-horizontal" method="POST">
                <div class="col-md-12" >
                    <legend><h3>Feed Attendance</h3></legend>
                    <div class="well col-md-12">
                        
                        <div class="form-group">
                         <center> <label><%=eno.toUpperCase() %>:<%=name.toUpperCase() %></label> </center> 
                          
                        </div>
                          <div class="form-group">
                            <label for="attd" class="col-sm-4 control-label">Attendance</label>
                            <div class="col-sm-6">
                              <input type="text" id="count" name="attd" required="required" placeholder="Total lectures attended this month" class="form-control"/>  
                            </div>
                        </div>   
                        <!-- Hidden Values-->
                        <input type="hidden" name="eno" value="<%=eno%>"/>
                        <input type="hidden" name="yop" value="<%=yop%>"/>
                        <input type="hidden" name="sem" value="<%=sem%>"/>
                        <input type="hidden" name="month" value="<%=month%>"/>
                        <input type="hidden" name="department" value="<%=department%>"/>
                        <input type="hidden" name="pointer" value="<%=pointer%>" />
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit"  formaction="confirm_feed_attd.jsp" class="btn btn-success">Feed</button>
                                <button type="reset"  class="btn btn-danger">Cancel </button>
                            </div>
                        </div>
                    </div> 

                </div>
            </form>
            
            
            <%
               }
            }
            else{ response.sendRedirect("feedAttendance.jsp");}
            
            %>
           
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>


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
            <form class="form-horizontal" method="POST">
                <div class="col-md-12" >
                    <legend><h3>Update Results</h3></legend>
                    <div class="well col-md-12">
                        <h3>Student Result Details</h3>
                         <div class="form-group">
                            <label for="yop" class="col-sm-4 control-label">Batch</label>
                            <div class="col-sm-6">
                                <select id="yop" name="yop" class="form-control" required="required" autofocus>
                                    <option value="">Select Year of Passing</option>
                                    <%
                                        for (int i = 2000; i <= 2020; i++) {
                                    %>
                                    <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                    <%
                                        }
                                        
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="eno" class="col-sm-4 control-label">Enrollment No.</label>
                            <div class="col-sm-6">
                               <input type="text" required class="form-control" name="eno"> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="semester" class="col-sm-4 control-label">Semester</label>
                            <div class="col-sm-6">
                                <select id="semester" name="semester" class="form-control" required="required" autofocus>
                                    <option value="">Select Semester</option>
                                    <%
                                        for (int i = 1; i <= 8; i++) {
                                    %>
                                    <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit"  formaction="viewForUpdateResults.jsp" class="btn btn-success">Go </button>
                                <button type="reset"  class="btn btn-danger">Cancel </button>
                            </div>
                        </div>
                    </div> 

                </div>
            </form>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

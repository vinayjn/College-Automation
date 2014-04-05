<%-- 
    Document   : timetable
    Created on : Mar 22, 2014, 10:42:33 PM
    Author     : Stark
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
       <%@include file="initcomps/navbar.jsp" %>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <form enctype="multipart/form-data" class="form-horizontal" method="POST">
                <div class="well col-sm-12 white" >
                    <h3>Timetables</h3>
                    <%
                        String msg = (String) session.getAttribute("msg");
                        if ("1".equals(msg)) {%>
                    <p class="text-success">Added Successfully!!</p>
                    <%
                            session.setAttribute("msg", null);
                        }
                        if ("0".equals(msg)) {%>
                    <p class="text-danger">Failed To Add!! Please try again</p>
                    <%
                            session.setAttribute("msg", null);
                        }
                    %>
                    <hr/>
                    <div class="form-group">
                        <label for="yop" class="col-sm-4 control-label">Year Of Passing</label>
                        <div class="col-sm-6">
                            <select id="yop" name="yop" class="form-control" required="required" autofocus>
                                <option value="">Select Year of Passing</option>
                                <% 
                                for(int i= 2000;i<=2020;i++){
                                %>
                                <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="semester" class="col-sm-4 control-label">Semester</label>
                        <div class="col-sm-6">
                            <select id="semeseter" name="semester" class="form-control" required="required">
                                <option value="">Select Semester</option>
                                <% 
                                for(int i= 1;i<=8;i++){
                                %>
                                <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label for="section" class="col-sm-4 control-label">Section</label>
                        <div class="col-sm-6">
                            <select id="section" name="section" class="form-control" required="required">
                                <option value="">Select Section</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="file" class="col-sm-4 control-label">Upload Timetable</label>
                        <div class="col-sm-6">
                            <input type="file" id="file" name="file" class="form-control" required="required">
                        </div>
                    </div>
                            
                    <div class= "pull-right">
                        <button type="submit" formaction="ptimetable" class="btn btn-success">Add </button>
                        <button type="reset"  class="btn btn-danger">Cancel </button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>
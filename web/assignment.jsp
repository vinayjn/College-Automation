<%-- 
    Document   : assignment
    Created on : Mar 23, 2014, 12:35:45 AM
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
                    <h3>Midsem Attendance</h3>
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
                        <label for="subject" class="col-sm-4 control-label">Subject</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="Please Enter Subject" name="subject" class="form-control" required="required" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="semester" class="col-sm-4 control-label">Semester</label>
                        <div class="col-sm-6">
                            <select id="semester" name="semester" class="form-control" required="required">
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

                    <div class="form-group">
                        <label for="date" class="col-sm-4 control-label">Date</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" name="date" required="required">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="file" class="col-sm-4 control-label">Upload Assignment</label>
                        <div class="col-sm-6">
                            <input type="file" id="file" name="file" class="date form-control" required="required">
                        </div>
                    </div>

                    <div class= "pull-right">
                        <button type="submit" formaction="passignment" class="btn btn-success">Add </button>
                        <button type="reset"  class="btn btn-danger">Cancel </button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>


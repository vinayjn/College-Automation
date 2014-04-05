<%-- 
    Document   : createBatch
    Created on : Mar 23, 2014, 1:04:25 AM
    Author     : Stark
--%>

<%@include file="initcomps/session.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>

        <%@include file="initcomps/navbar.jsp" %>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <form enctype="multipart/form-data" class="form-horizontal" method="POST">
                <div class="well col-sm-12 white" >
                    <h3>Add New Batch</h3>
                    <a href="files/Excels/NewBatch.xls">Download Format</a>
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
                        <label for="dept" class="col-sm-4 control-label">Department </label>
                        <div class="col-sm-6">
                            <select name="dept" class="form-control" required="required">
                                <option value="">Department</option>
                                <option value="CSE">CSE</option>
                                <option value="CE">CE</option>
                                <option value="CM">CM</option>
                                <option value="EC">EC</option>
                                <option value="EX">EX</option>
                                <option value="FT">FT</option>
                                <option value="ME">ME</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="file" class="col-sm-4 control-label">Upload Batch Excel</label>
                        <div class="col-sm-6">
                            <input type="file" id="file" name="file" class="date form-control" required="required">
                        </div>
                    </div>

                    <div class= "pull-right">
                        <button type="submit" formaction="pbatch" class="btn btn-success">Add </button>
                        <button type="reset"  class="btn btn-danger">Cancel </button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>
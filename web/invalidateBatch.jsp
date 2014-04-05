<%-- 
    Document   : invalidateBatch
    Created on : Mar 29, 2014, 5:29:40 PM
    Author     : Stark
--%>
<%@include file="initcomps/session.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>
            <form class="form-horizontal" method="POST">
                <div class="col-md-12" >
                    <legend><h3>Invalidate Batch</h3></legend>
                    <%
                        String msg = (String) session.getAttribute("msg");
                        if ("1".equals(msg)) {%>
                    <p class="text-success">Records Invalidated : <% out.print((String) session.getAttribute("records"));%></p>
                    <%
                            session.setAttribute("msg", null);
                        }
                        if ("0".equals(msg)) {%>
                    <p class="text-danger">Failed To Invalidate!! Please try again</p>
                    <%
                            session.setAttribute("msg", null);
                        }
                    %>
                    <div class="well col-md-12">
                        <h3>Batch Details</h3>
                        <div class="form-group">
                            <label for="dept" class="col-sm-4 control-label">Department </label>
                            <div class="col-sm-6">
                                <select name="dept" class="form-control" id="dept" required="required">
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
                            <label for="yop" class="col-sm-4 control-label">Year Of Passing</label>
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
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="pinvalidatebatch" class="btn btn-success">Invalidate </button>
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
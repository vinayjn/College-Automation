<%-- 
    Document   : questionPapers
    Created on : Mar 22, 2014, 11:36:28 PM
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
                    <h3>Question Papers</h3>
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
                        <label for="year" class="col-sm-4 control-label">Year</label>
                        <div class="col-sm-6">
                            <select id="year" name="year" class="form-control" required="required" autofocus>
                                <option value="">Select Year</option>
                                <%
                                    for (int i = 2000; i <= 2014; i++) {
                                %>
                                <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="month" class="col-sm-4 control-label">Month</label>
                        <div class="col-sm-6">
                            <select id="month" name="month" class="form-control" required="required">
                                <option value="">Select Month</option>
                                <option value="January">January</option>
                                <option value="February">February</option>
                                <option value="March">March</option>
                                <option value="April">April</option>
                                <option value="May">May</option>
                                <option value="June">June</option>
                                <option value="July">July</option>
                                <option value="August">August</option>
                                <option value="September">September</option>
                                <option value="October">October</option>
                                <option value="November">November</option>
                                <option value="December">December</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subject" class="col-sm-4 control-label">Subject</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="Please Enter Subject" name="subject" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="file" class="col-sm-4 control-label">Upload Paper</label>
                        <div class="col-sm-6">
                            <input type="file" id="file" name="file" class="form-control" required="required">
                        </div>
                    </div>
                    <div class= "pull-right">
                        <button type="submit" formaction="pquestionpapers" class="btn btn-success">Add </button>
                        <button type="reset"  class="btn btn-danger">Cancel </button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

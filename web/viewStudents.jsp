<%-- 
    Document   : viewStudents
    Created on : Mar 28, 2014, 11:24:20 AM
    Author     : Stark
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utility.Utility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>
                <div class="well col-sm-12 form-group">
                       <form method="get"> 
                           <div class="col-sm-4">
                            <select id="yop" name="yop" class="form-control" required="required" autofocus>
                                <option value="">Select Year Of Passing</option>
                                <%
                                    for (int i = 2005; i <= 2025; i++) {
                                %>
                                <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class=" col-sm-4">
                            <button type="submit" name="feeder" formaction="viewStudents.jsp" class="btn btn-success">Filter </button>
                        </div>
                </form>
            </div>
            <br/>
            <br/>
            <% 
            
            String yop = request.getParameter("yop");
            if(yop!=null){
            %>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading text-center"><h3>Student Details</h3></div>
                <!-- Table -->
                <table class="table">
                    <thead>
                    <th>Name</th>
                    <th>Enrollment No.</th>
                    <th>Address</th>
                    <th>Phone</th>
                    </thead>
                    <tbody>
                        <%  
                            Connection con = Utility.openConnection("college_" + session.getAttribute("dept").toString());
                            Statement stat = con.createStatement();
                            String sql = "select `name`,`enrollment`,`address`,`mobile_number` from `student_details` where `yop`='"+yop+"' order by `name`";
                            ResultSet rs = stat.executeQuery(sql);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("name")%></td>
                            <td><%=rs.getString("enrollment")%></td>
                            <td><%=rs.getString("address")%></td>
                            <td><%=rs.getString("mobile_number")%></td>
                        </tr> <% }%>
                    </tbody>
                </table>
            </div>
                    <% }%>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>
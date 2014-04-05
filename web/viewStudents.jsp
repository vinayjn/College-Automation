<%-- 
    Document   : viewStudents
    Created on : Mar 28, 2014, 11:24:20 AM
    Author     : Stark
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading text-center">Student Details</div>
                <!-- Table -->
                <table class="table">
                    <thead>
                    <th>Name</th>
                    <th>Class</th>
                    <th>Roll</th>
                    <th>Phone</th>
                    <th>Address</th>
                    </thead>
                    <tbody><tr>
                        <td>Vinay</td>
                        <td>2014</td>
                        <td>CS-65</td>
                        <td>9981241341</td>
                        <td>Malharganj</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>
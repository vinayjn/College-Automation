<%-- 
    Document   : index
    Created on : Mar 19, 2014, 8:27:03 PM
    Author     : Stark
--%>
<%
    session = request.getSession(false);
    String userid = (String) session.getAttribute("userid");
    if (userid != null) {
        response.sendRedirect("home.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login | Class Automation System</title>
        <link href="resources/css/bootstrap.css" rel="stylesheet">
        <link href="resources/css/signin.css" rel="stylesheet">

    </head>
    <body style="background: #ffffff" class="login">
        <div class="well container">
            <div class="text-center">
                <h2>College Automation System</h2>
            </div>
            <div class="tab-content">
                <div id="login" class="tab-pane active">
                    <form action="login" class="form-signin" method="post">
                        <p class="text-center">
                            Select Department and Role
                        </p>
                        <div class= "row form-group">
                            <div class="col-md-6"> 
                                <select name="dept" class="form-control" required="required">
                                    <option value="">Department</option>
                                    <option value="college">College</option>
                                    <option value="CSE">CSE</option>
                                    <option value="CE">CE</option>
                                    <option value="CM">CM</option>
                                    <option value="EC">EC</option>
                                    <option value="EX">EX</option>
                                    <option value="FT">FT</option>
                                    <option value="ME">ME</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <select name="role" class="form-control" required="required">
                                    <option value="">Role</option>
                                    <option value="admin">Admin</option>
                                    <option value="faculty">Faculty</option>
                                    <option value="hod">HOD</option>
                                    <option value="coordinator">Coordinator</option>
                                </select>
                            </div>
                        </div>
                        <p class="text-center">
                            Enter your username and password
                        </p>
                        <input type="text" name="userid" placeholder="Username" class="form-control" required="required" autofocus="autofocus">
                        <input type="password" name="password" placeholder="Password" class="form-control" required="required">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    </form>
                </div>
                <div id="forgot" class="tab-pane">
                    <form action="index.html" class="form-signin">
                        <p class="text-center">Enter your valid e-mail</p>
                        <input type="email" name="email" placeholder="mail@domain.com" required="required" class="form-control">
                        <br>
                        <button class="btn btn-lg btn-danger btn-block" type="submit">Recover Password</button>
                    </form>
                </div>
            </div>
            <div class="text-center">
                <%
                    String sess = request.getParameter("session");
                    String msg = request.getParameter("msg");
                    if ("0".equals(sess)) {%>
                <p class="text-danger"><b>You Must Login First</b></p>
                <% }
                    if ("0".equals(msg)) {%>
                <p class="text-danger"><b>Invalid Username or Password</b></p>
                <% }
                %>
                <ul class="list-inline">
                    <li> <a href="#" onclick="showHide('login', 'forgot');">Login</a>  </li>
                    <li> <a href="#" onclick="showHide('forgot', 'login');">Forgot Password</a>  </li>
                </ul>
            </div>
        </div><!-- /container -->
        <script src="resources/lib/jquery.min.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script>
                        function showHide(id1, id2) {
                            var toShow = document.getElementById(id1);
                            var toHide = document.getElementById(id2);
                            toShow.className = "tab-pane active";
                            toHide.className = "tab-pane";
                        }
        </script>    
    </body>
</html>
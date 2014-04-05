<%-- 
    Document   : manageFaculties
    Created on : Mar 25, 2014, 3:05:49 AM
    Author     : Rahul
--%>

<%@include file="initcomps/session.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <%@include file="initcomps/navbar.jsp" %>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="form-group col-md-12 top" >
                <div class="pull-right" style="padding-top:15px;">    
                    <button type="button" class="btn btn-success" onclick="add();"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Add New</strong></button>
                    <button type="button" class="btn btn-danger" onclick="del();"><span class="glyphicon glyphicon-trash">&nbsp;</span><strong>Delete</strong></button>
                    <button type="button" class="btn btn-primary" onclick="edit();"><span class="glyphicon glyphicon-edit">&nbsp;</span><strong>Edit</strong></button>
                </div>
                <%
                    String msg = (String) session.getAttribute("msg");
                    if ("1".equals(msg)) {%>
                <p class="text-success">Action Completed Successfully!!</p>
                <%
                        session.setAttribute("msg", null);
                    }
                    if ("0".equals(msg)) {%>
                <p class="text-danger">Action Failed!! Please try again</p>
                <%
                        session.setAttribute("msg", null);
                    }
                %>
            </div>
            <div id="add-faculty" style="display:block" >
                <form class="form-horizontal" method="POST">
                    <div class="col-md-12" >
                        <legend><h3>Add New Faculty</h3></legend>
                        <div class="well col-md-12">
                            <h3>User Details</h3>
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
                                <label for="userid" class="col-sm-4 control-label">User Id</label>
                                <div class="col-sm-6">
                                    <input type="text" id="userid" name="userid" class="form-control" required="required" placeholder="User Id as per Organization Norms">
                                </div>
                            </div>
                        </div> 
                        <div class="well col-md-12">
                            <h3>Personal Details</h3> 
                            <div class="form-group">
                                <label for="name" class="col-sm-4 control-label">Full Name</label>
                                <div class="col-sm-6">
                                    <input type="text" id="name" name="name" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dob" class="col-sm-4 control-label">Date Of Birth</label>
                                <div class="col-sm-6">
                                    <input type="date" id="dob" name="dob" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bloodgroup" class="col-sm-4 control-label">Blood Group</label>
                                <div class="col-sm-6">
                                    <input type="text" id="bloodgroup"  name="bloodgroup" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pancard" class="col-sm-4 control-label">PAN NO.</label>
                                <div class="col-sm-6">
                                    <input type="text" id="pancard" name="pancard" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="voterid" class="col-sm-4 control-label">Voter Id</label>
                                <div class="col-sm-6">
                                    <input type="text" id="voterid" name="voterid" class="form-control" required="required">
                                </div>
                            </div>

                        </div>  

                        <div class="well col-md-12">
                            <h3>Contact Details</h3>
                            <div class="form-group">
                                <label for="emailid" class="col-sm-4 control-label">Email Id</label>
                                <div class="col-sm-6">
                                    <input type="email" id="emailid"  name="emailid" class="form-control" required="required" placeholder="mail@domain.com">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="contactno" class="col-sm-4 control-label">Contact No.</label>
                                <div class="col-sm-6">
                                    <input type="text" id="contactno" name="contactno" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="adress" class="col-sm-4 control-label">Address</label>
                                <div class="col-sm-6">
                                    <textarea  name="address" id="address" class="form-control" required="required"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="well col-md-12">
                            <h3>Professional Profile</h3>
                            <div class="form-group">
                                <label for="qualification" class="col-sm-4 control-label">Qualification</label>
                                <div class="col-sm-6">
                                    <input type="text" id="qualification"  name="qualification" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="experience" class="col-sm-4 control-label">Experience</label>
                                <div class="col-sm-6">
                                    <input type="text" id="experience" name="experience" class="form-control" required="required" placeholder="in years">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="doj" class="col-sm-4 control-label">Date Of Joining</label>
                                <div class="col-sm-6">
                                    <input type="date" id="doj"  name="doj" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="designation" class="col-sm-4 control-label">Designation</label>
                                <div class="col-sm-6">
                                    <input type="text" id="designation" name="designation" class="form-control" required="required">
                                </div>
                            </div>
                        </div> 
                        <div class="well col-md-12">
                            <h3>Bank Details</h3>
                            <div class="form-group">
                                <label for="bankacc" class="col-sm-4 control-label">Bank Account No.</label>
                                <div class="col-sm-6">
                                    <input type="text" id="bankacc" name="bankacc" class="form-control" required="required" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bankname" class="col-sm-4 control-label">Bank Name</label>
                                <div class="col-sm-6">
                                    <input type="text" id="bankname" name="bankname" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ifsc" class="col-sm-4 control-label">IFSC Code</label>
                                <div class="col-sm-6">
                                    <input type="text" id="ifsc" name="ifsc" class="form-control" required="required">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-sm-6"></div>    
                                <div class="pull-right col-md-4">
                                    <button type="submit" name="add" formaction="pmanagefaculty" class="btn btn-success">Add </button>
                                    <button type="reset"  class="btn btn-danger">Cancel </button>
                                </div>
                            </div> 
                        </div>    
                    </div>
                </form>
            </div>
            <div id="edit-faculty" style="display:none">
                <form class="form-horizontal" method="POST">
                    <legend><h3>Edit Faculty</h3></legend> 
                    <div class="well col-sm-12 white" >
                        <div class="col-md-10">
                            <div class="form-group">
                                <label for="dep1" class="col-sm-4 control-label">Department </label>
                                <div class="col-sm-6">
                                    <select name="dept" class="form-control" id="dep1" required="required">
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
                                <label for="uid1" class="col-sm-4 control-label">User Id</label>
                                <div class="col-sm-6">
                                    <input type="text" id="uid1" name="userid" class="form-control" required="required" placeholder="User Id as per Organization Norms">
                                </div>
                            </div>  
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="pmanagefaculty" class="btn btn-success">Edit </button>
                                <button type="reset"  class="btn btn-danger">Cancel </button>
                            </div>
                        </div>  
                    </div>  
                </form>     
            </div>
            <div id="delete-faculty" style="display:none">
                <form class="form-horizontal" method="POST">
                    <legend><h3>Remove Faculty</h3></legend> 
                    <div class="well col-sm-12 white" >
                        <div class="col-md-10">
                            <div class="form-group">
                                <label for="dep" class="col-sm-4 control-label">Department </label>
                                <div class="col-sm-6">
                                    <select name="dept" class="form-control" id="dep" required="required">
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
                                <label for="uid" class="col-sm-4 control-label">User Id</label>
                                <div class="col-sm-6">
                                    <input type="text" id="uid" name="userid" class="form-control" required="required" placeholder="User Id as per Organization Norms">
                                </div>
                            </div>  
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="pmanagefaculty" class="btn btn-danger">Delete </button>
                                <button type="reset"  class="btn btn-info">Cancel </button>
                            </div>
                        </div> 
                    </div>  
                </form>    
            </div>
        </div>
        <script>
                    function add() {
                        document.getElementById("add-faculty").style.display = "block";
                        document.getElementById("edit-faculty").style.display = "none";
                        document.getElementById("delete-faculty").style.display = "none";
                    }
                    function del() {
                        document.getElementById("add-faculty").style.display = "none";
                        document.getElementById("delete-faculty").style.display = "block";
                        document.getElementById("edit-faculty").style.display = "none";

                    }
                    function edit() {
                        document.getElementById("add-faculty").style.display = "none";
                        document.getElementById("edit-faculty").style.display = "block";
                        document.getElementById("delete-faculty").style.display = "none";
                    }
        </script>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>
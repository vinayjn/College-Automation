
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utility.Utility"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>

            <%
                Connection con;
                Statement stat;
                ResultSet rs;
                String yop, semester,sql;
                if (request.getParameter("feeder") != null) {
                    yop = request.getParameter("yop");
                    session.setAttribute("yop", yop);
                    semester = request.getParameter("semester");
                    session.setAttribute("semester", semester);
                    sql = "INSERT INTO result_analysis (enrollment,semester,yop) SELECT enrollment,'"+semester+"','"+yop+"' FROM student_details where yop='"+yop+"'";
                    con = Utility.openConnection("college_"+session.getAttribute("dept").toString());
                    stat = con.createStatement();
                    stat.executeUpdate(sql);
                } else {
                    yop = (String) session.getAttribute("yop");
                    semester = (String) session.getAttribute("semester");
                }
                ArrayList<String> detail;
                int offset = (Integer) session.getAttribute("offset");
                detail = Utility.fetchDetail(yop, semester, offset, session.getAttribute("dept").toString());
                if (offset != 0) {
                    String sb1 = request.getParameter("sb1");
                    String sb2 = request.getParameter("sb2");
                    String sb3 = request.getParameter("sb3");
                    String sb4 = request.getParameter("sb4");
                    String sb5 = request.getParameter("sb5");
                    String atkt=request.getParameter("atkt");
                    String enrollment = request.getParameter("enrollment");
                    String cgpa=request.getParameter("cgpa");
                    String sgpa=request.getParameter("sgpa");
                    sql = "update result_analysis set subject_one='"+sb1+
                            "',subject_two='"+sb2+
                            "',subject_three='"+sb3+
                            "',subject_four='"+sb4+
                            "',subject_five='"+sb5+
                            "',cgpa='"+cgpa+
                            "',sgpa='"+sgpa+
                            "',atkt='"+atkt+
                            "' where enrollment='"+enrollment+
                            "' AND semester="+semester;
                    boolean fdetail = Utility.feedDetail(sql, session.getAttribute("dept").toString());
                    if (!fdetail) { %>
            <h3 class="text-danger text-center">Error While Updating</h3>
            <a href="home.jsp"><p class="text-center">Click here to return to home</p></a>
            <% }
            }
            if (detail == null || offset == 0 && detail.size() != 7) { %>
            <h3 class="text-danger text-center">All Records Updated, nothing to update</h3>
            <a href="home.jsp"><p class="text-center">Click here to return to home</p></a>

            <% } else {
                offset++;
                session.setAttribute("offset", offset);
            %>
            <form class="form-horizontal" method="POST">
                <div class="col-md-12" >
                    <h3>Student Result Details</h3><hr/>
                    <div class="well col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name" class="control-label"><%= detail.get(0).toUpperCase()%></label>
                            </div>
                        </div> 
                        <div class="col-md-6">
                            <input type="hidden" value="<%= detail.get(1).toUpperCase()%>" name="enrollment" />
                            <div class="form-group">
                                <label for="enrollment" class="control-label"><%= detail.get(1).toUpperCase()%></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb1" class="col-sm-4 control-label"><%= detail.get(2).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb1" name="sb1" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb2" class="col-sm-4 control-label"><%= detail.get(3).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb2" name="sb2" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb3" class="col-sm-4 control-label"><%= detail.get(4).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb3" name="sb3" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb4" class="col-sm-4 control-label"><%= detail.get(5).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb4" name="sb4" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb5" class="col-sm-4 control-label"><%= detail.get(6).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb5" name="sb5" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="well col-md-12">
                        <div class="col-md-4">
                           <div class="row">
                                <div class="col-md-2">    
                                <label for="atkt" class=" control-label">ATKT</label>
                                </div>
                                 <div class="col-md-10">
                                <input type="text" name="atkt" placeholder="mention subject codes" class="form-control"/>
                                </div>
                              </div> 
                            
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="row">
                                <div class="col-md-2">    
                                <label for="cgpa" class=" control-label">CGPA</label>
                                </div>
                                    <div class="col-md-10">
                                <input type="text" name="cgpa" class="form-control" required/>
                                </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="row">
                                <div class="col-md-2">    
                                <label for="sgpa" class=" control-label">SGPA</label>
                                </div>
                                    <div class="col-md-10">
                                <input type="text" name="sgpa" class="form-control" required/>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="_feedResult.jsp" class="btn btn-success">Feed </button>
                                <button type="reset"  class="btn btn-danger">Cancel </button>
                            </div>
                        </div>
                    </div>   
                </div>
            </form>
        </div>
        <% }%>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

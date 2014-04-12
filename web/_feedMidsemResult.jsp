<%-- 
    Document   : _feedMidsemResult
    Created on : Apr 10, 2014, 8:18:07 PM
    Author     : Stark
--%>

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
                String yop, semester;
                if (request.getParameter("feeder") != null) {
                    yop = request.getParameter("yop");
                    session.setAttribute("yop", yop);
                    semester = request.getParameter("semester");
                    session.setAttribute("semester", semester);
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
                    String enrollment = request.getParameter("enrollment");
                    String sql = "update mst_result_analysis set subject_one='"+sb1+
                            "',subject_two='"+sb2+
                            "',subject_three='"+sb3+
                            "',subject_four='"+sb4+
                            "',subject_five='"+sb5+
                            "',semester='"+semester+
                            "',yop='"+yop+
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
                <% if(offset<=1){ %>
                <a href="setMaxMarks.jsp" onclick="window.open(this.href, 'mywin','left=20,top=20,width=500,height=700,toolbar=1,resizable=0'); return false;" ><h2 class="text-danger text-center">Click Here Set Maximum Marks</h2></a>
                <% } %>
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
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="_feedMidsemResult.jsp" class="btn btn-success">Feed </button>
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

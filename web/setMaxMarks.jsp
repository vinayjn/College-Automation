<%-- 
    Document   : setMaxMarks
    Created on : Apr 10, 2014, 8:59:00 PM
    Author     : Stark
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="utility.Utility"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/session.jsp" %>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="container">
            <%
                        String msg = request.getParameter("msg");
                        if ("1".equals(msg)) {%>
                    <p class="text-success">Updated Successfully!!</p>
                    <%}
                        if ("0".equals(msg)) {%>
                    <p class="text-danger">Failed To Update!! Please try again</p>
                    <% }
                    %>
            <%
             String yop = (String) session.getAttribute("yop");
             String semester = (String) session.getAttribute("semester");
             Connection con = Utility.openConnection("college_"+session.getAttribute("dept").toString());
             Statement stat = con.createStatement();
             ArrayList<String> subjects= new ArrayList<String>();
             System.out.println(yop);
             System.out.println(semester);
             String sql = "select subject from subjects where yop='"+yop+"' AND semester='"+semester+"'";
             ResultSet rs =null; 
             try{
             rs = stat.executeQuery(sql);
             }catch(Exception ex){
                 System.out.print(ex);
             }
             while(rs.next()){
                 subjects.add(rs.getString(1));
             }
            %>
            <form class="form-horizontal" method="POST">
                <div class="col-md-12" >
                    <h3>Set Max Marks</h3><hr/>
                    <div class="form-group">
                        <label for="sb1" class="col-sm-4 control-label"><%= subjects.get(0).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb1" name="sb1" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb2" class="col-sm-4 control-label"><%= subjects.get(1).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb2" name="sb2" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb3" class="col-sm-4 control-label"><%= subjects.get(2).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb3" name="sb3" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb4" class="col-sm-4 control-label"><%= subjects.get(3).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb4" name="sb4" class="form-control" required="required">
                        </div>
                    </div>
                        <%// if(semester!="8"){ %>
                    <div class="form-group">
                        <label for="sb5" class="col-sm-4 control-label"><%= subjects.get(4).toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb5" name="sb5" class="form-control" required="required">
                        </div>
                    </div>
                        <%  //} %>
                    <div class="col-md-12">
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="setmarks" class="btn btn-success">Set </button>
                                <button type="reset"  class="btn btn-danger">Cancel </button>
                            </div>
                        </div>
                    </div>   
                </div>
            </form>
        </div>
    </body>
</html>

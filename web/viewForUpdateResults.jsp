
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utility.Utility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>
            <%
            ResultSet result=Utility.fetchIndividualResults(request.getParameter("eno"),request.getParameter("semester"), request.getParameter("yop"),session.getAttribute("dept").toString());
          ArrayList<ResultSet>details=Utility.fetchIndividualDetail(request.getParameter("eno"),request.getParameter("yop"),request.getParameter("semester"),session.getAttribute("dept").toString());
          ResultSet subjects,info;
          info=details.get(0);
          subjects=details.get(1);
          String sub_list[]=new String[5];
          int i=0;
          while(subjects.next()){
              sub_list[i++]=(subjects.getString("subject"));
          }
          
          if(info!=null && result!=null){
            info.next();
            result.next();
            %>
            <form class="form-horizontal" method="POST">
                <div class="col-md-12" >
                    <h3>Existing Result Details</h3><hr/>
                    <div class="well col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name" class="control-label"><%= info.getString(2).toUpperCase()%></label>
                            </div>
                        </div> 
                        <div class="col-md-6"> 
                            <input type="hidden" value="<%=info.getString(2).toUpperCase()%>" name="enrollment" />
                            <input type="hidden" value="<%=request.getParameter("semester")%>" name="semester" />
                            
                            <div class="form-group">
                                <label for="enrollment" class="control-label"><%= info.getString(1).toUpperCase()%></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb1" class="col-sm-4 control-label"><%= sub_list[0].toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb1" name="sb1" class="form-control" required="required" value="<%=result.getString(5).toUpperCase() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb2" class="col-sm-4 control-label"><%= sub_list[1].toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb2" name="sb2" class="form-control" required="required" value="<%=result.getString(6).toUpperCase() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb3" class="col-sm-4 control-label"><%= sub_list[2].toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb3" name="sb3" class="form-control" required="required" value="<%=result.getString(7).toUpperCase() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb4" class="col-sm-4 control-label"><%= sub_list[3].toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb4" name="sb4" class="form-control" required="required" value="<%=result.getString(8).toUpperCase() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sb5" class="col-sm-4 control-label"><%= sub_list[4].toUpperCase()%></label>
                        <div class="col-sm-6">
                            <input type="text" id="sb5" name="sb5" class="form-control" required="required" value="<%=result.getString(9).toUpperCase() %>">
                        </div>
                    </div>
                    <div class="well col-md-12">
                        <div class="col-md-4">
                           <div class="row">
                                <div class="col-md-2">    
                                <label for="atkt" class=" control-label">ATKT</label>
                                </div>
                                 <div class="col-md-10">
                                <input type="text" name="atkt" placeholder="mention subject codes" class="form-control" value="<%=result.getString(4).toUpperCase() %>"/>
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
                                <input type="text" name="cgpa" class="form-control" required value="<%=result.getString(2).toUpperCase() %>"/>
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
                                <input type="text" name="sgpa" class="form-control" required value="<%=result.getString(3).toUpperCase() %>"/>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6"></div>    
                            <div class="pull-right col-md-4">
                                <button type="submit" formaction="confirmUpdateResult.jsp" class="btn btn-success">Update</button>
                                <button type="reset"  class="btn btn-danger">Cancel </button>
                            </div>
                        </div>
                    </div>   
                </div>
            </form>
            <%}
            else{out.println("<h2>No Record Exists</h2><a href='updateResult.jsp'>Try Again</a>");} 
            %>            
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

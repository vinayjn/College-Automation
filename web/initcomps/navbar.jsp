<%@include file="session.jsp" %>
<%
    String department = (String) session.getAttribute("dept");
    String roles = (String) session.getAttribute("role");
%> 
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home.jsp"><% if(roles!=null) out.print(roles.toUpperCase());%></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Image Modules <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="assignment.jsp">Assignments</a></li>
                        <li class="divider"></li>
                        <li><a href="feeRecords.jsp">Fee Records</a></li>
                        <li class="divider"></li>
                        <li><a href="mstAttendance.jsp">Midsem Attendance</a></li>
                        <li class="divider"></li>
                        <li><a href="mstQuestionPapers.jsp">Midsem Question Papers</a></li>
                        <li class="divider"></li>
                        <li><a href="questionPapers.jsp">Question Papers</a></li>
                        <li class="divider"></li>
                        <li><a href="timetable.jsp">Timetables</a></li>
                    </ul>
                </li>
                <li>
                  <a href="manageFaculties.jsp">Manage Faculties</a>  
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="home.jsp"><% if (roles != null || department != null) {
                    out.print(department.toUpperCase() + " " + role.toUpperCase());
                }%></a></li>
                <li><a href="logout.jsp"></span>Logout&nbsp;<span class="glyphicon glyphicon-off">&nbsp;</a></li>
            </ul>
        </div>
    </div>
</div>
<%@include file="left.jsp" %>
</nav>
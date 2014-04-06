<%@include file="session.jsp" %>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home.jsp"><%if(role!=null) out.print(role.toUpperCase());%></a>
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
                <li><a href="home.jsp"><% if (role != null || dept != null) {
                    out.print(dept.toUpperCase() + " " + role.toUpperCase());
                }%></a></li>
                <li><a href="logout.jsp">Logout&nbsp;<span class="glyphicon glyphicon-off">&nbsp;</span></a></li>
            </ul>
        </div>
    </div>
</div>
<%@include file="left.jsp" %>
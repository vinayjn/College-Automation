<%-- 
    Document   : home
    Created on : Mar 20, 2014, 4:01:07 PM
    Author     : Stark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="initcomps/head.jsp" %>
    <body>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>
           <div class="col-md-10"> 
                <h4 class="m-t-none">Todo List</h4> 
                <ul class="list-group gutter list-group-lg list-group-sp sortable"> 
                    <li class="list-group-item box-shadow" draggable="true"> 
                        <a href="#" class="pull-right" data-dismiss="alert"> 
                            <i class="fa fa-times icon-muted"></i> 
                        </a> 
                        <span class="pull-left media-xs"> 
                            <i class="fa fa-sort icon-muted fa m-r-sm"></i> 
                            <a href="#todo-1" data-toggle="class:text-lt text-success" class="active"> 
                                <i class="fa fa-square-o fa-fw text"></i> 
                                <i class="fa fa-check-square-o fa-fw text-active text-success"></i> 
                            </a> 
                        </span> 
                        <div class="clear text-success text-lt" id="todo-1"> Create a new batch for year 2018 
                        </div> 
                    </li> 
                    <li class="list-group-item box-shadow" draggable="true"> 
                        <a href="#" class="pull-right" data-dismiss="alert"> 
                            <i class="fa fa-times icon-muted"></i> 
                        </a> 
                        <span class="pull-left media-xs"> 
                            <i class="fa fa-sort icon-muted fa m-r-sm"></i> 
                            <a href="#todo-2" data-toggle="class:text-lt text-danger"> 
                                <i class="fa fa-square-o fa-fw text"></i> 
                                <i class="fa fa-check-square-o fa-fw text-active text-danger"></i> 
                            </a> 
                        </span> 
                        <div class="clear" id="todo-2"> Feed Midsem Results of 2014 batch 
                        </div> 
                    </li> 
                    <li class="list-group-item box-shadow" draggable="true"> 
                        <a href="#" class="pull-right" data-dismiss="alert"> 
                            <i class="fa fa-times icon-muted"></i> 
                        </a> 
                        <span class="pull-left media-xs"> 
                            <i class="fa fa-sort icon-muted fa m-r-sm"></i> 
                            <a href="#todo-3" data-toggle="class:text-lt"> 
                                <i class="fa fa-square-o fa-fw text"></i> 
                                <i class="fa fa-check-square-o fa-fw text-active text-success"></i> 
                            </a> 
                        </span> 
                        <div class="clear" id="todo-3"> Upload Question Papers for 8th semester 
                        </div> 
                    </li> 
                    <li class="list-group-item box-shadow" draggable="true"> 
                        <a href="#" class="pull-right" data-dismiss="alert"> 
                            <i class="fa fa-times icon-muted"></i> 
                        </a> 
                        <span class="pull-left media-xs"> 
                            <i class="fa fa-sort icon-muted fa m-r-sm"></i> 
                            <a href="#todo-4" data-toggle="class:text-lt"> 
                                <i class="fa fa-square-o fa-fw text"></i> 
                                <i class="fa fa-check-square-o fa-fw text-active text-success"></i> 
                            </a> 
                        </span> 
                        <div class="clear" id="todo-4"> Generate sessional marks for 2015 batch students 
                        </div> 
                    </li> 
                    <li class="list-group-item box-shadow" draggable="true"> 
                        <a href="#" class="pull-right" data-dismiss="alert"> 
                            <i class="fa fa-times icon-muted"></i> 
                        </a> 
                        <span class="pull-left media-xs"> 
                            <i class="fa fa-sort icon-muted fa m-r-sm"></i>
                            <a href="#todo-5" data-toggle="class:text-lt"> 
                                <i class="fa fa-square-o fa-fw text"></i> 
                                <i class="fa fa-check-square-o fa-fw text-active text-success"></i> 
                            </a>
                        </span> 
                        <div class="clear" id="todo-5"> Notify 8th semester students for placement activity 
                        </div> 
                    </li> 
                    <li class="list-group-item box-shadow" draggable="true"> 
                        <a href="#" class="pull-right" data-dismiss="alert"> 
                            <i class="fa fa-times icon-muted"></i> 
                        </a> 
                        <span class="pull-left media-xs"> 
                            <i class="fa fa-sort icon-muted fa m-r-sm"></i> 
                            <a href="#todo-6" data-toggle="class:text-lt"> 
                                <i class="fa fa-square-o fa-fw text"></i> 
                                <i class="fa fa-check-square-o fa-fw text-active text-success"></i> 
                            </a> 
                        </span> 
                        <div class="clear" id="todo-6"> Notify 2nd semester students for upcoming workshop 
                        </div> 
                    </li> 
                </ul> 
            </div>
        </div>
        <%@include file="initcomps/footer.jsp" %>
    </body>
</html>

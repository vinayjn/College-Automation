
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utility.Utility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>College Automation System</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/dashboard.css" rel="stylesheet">
    <style type="text/css" title="currentStyle">
			@import "resources/DataTables/media/css/demo_page.css";
			@import "resources/DataTables/media/css/demo_table_jui.css";
			@import "resources/DataTables/media/support/themes/smoothness/jquery-ui-1.8.4.custom.css";
		       
    </style>
      <style>@import "resources/DataTables/media/support/syntax/css/shCore.css";</style>
		<script type="text/javascript" language="javascript" src="resources/DataTables/media/js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="resources/DataTables/media/js/jquery.dataTables.js"></script>
</head>
    <body>
        <script type="text/javascript" charset="utf-8">
		 var asInitVals = new Array();
		 $(document).ready(function() {
				/* Initialise the DataTable */
				var oTable = $('#example').dataTable( {
				  "bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"oLanguage": {
						"sSearch": "Search all columns:"
					}
				} );
				
					$("tfoot input").keyup( function () {
					/* Filter on the column (the index) of this element */
					oTable.fnFilter( this.value, $("tfoot input").index(this) );
				} );
				
				
				
				/*
				 * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
				 * the footer
				 */
				$("tfoot input").each( function (i) {
					asInitVals[i] = this.value;
				} );
				
				$("tfoot input").focus( function () {
					if ( this.className == "search_init" )
					{
						this.className = "";
						this.value = "";
					}
				} );
				
				$("tfoot input").blur( function (i) {
					if ( this.value == "" )
					{
						this.className = "search_init";
						this.value = asInitVals[$("tfoot input").index(this)];
					}
				} );
				/* Add event listeners to the two range filtering inputs */
				$('#min').keyup( function() { oTable.fnDraw(); } );
				$('#max').keyup( function() { oTable.fnDraw(); } );
				
			
			} );
			
		  /* Custom filtering function which will filter data in column four between two values */
			$.fn.dataTableExt.afnFiltering.push(
				function( oSettings, aData, iDataIndex ) {
					var iMin = document.getElementById('min').value * 1;
					var iMax = document.getElementById('max').value * 1;
					
					var cgpa = aData[8] == "-" ? 0 : aData[8]*1;
					
					if ( iMin == "" && iMax == "" )
					{ 
						return true;
					}
					else if ( iMin == "" && cgpa <= iMax )
					{
						return true;
					}
					else if ( iMin <= cgpa && "" == iMax )
					{
						return true;
					}
					else if ( iMin <= cgpa && cgpa <= iMax )
					{
						return true;
					}
					return false;
				}
			);
	  </script>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%@include file="initcomps/navbar.jsp" %>
          <%
          ResultSet result=Utility.fetchResults(request.getParameter("semester"), request.getParameter("yop"),session.getAttribute("dept").toString());
          ArrayList<ResultSet>details=Utility.fetchResultSubjectDetail(request.getParameter("yop"),request.getParameter("semester"),session.getAttribute("dept").toString());
          ResultSet subjects,info;
          info=details.get(0);
          subjects=details.get(1);
          
          ArrayList<String>sub_list=null;
          
          
          %>
          <div id="container">
			<h2>Analyze Results</h2>
			<div class="demo_jui">
			<table border="0" cellspacing="5" cellpadding="5">
				<tr>
					<td>Minimum CGPA:</td>
					<td><input type="text" id="min" name="min"></td>
				</tr>
				<tr>
					<td>Maximum CGPA:</td>
					<td><input type="text" id="max" name="max"></td>
				</tr>
				
			</table>
                            <br>
                            <br>
                            <div id="dt_example">
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Enrollment No.</th>
			<th>Name</th>
                       <% int flag=0;
                        while(subjects.next()){
                            flag++;
                        
                        %>   
                      
                     <th><%=subjects.getString("subject")%></th>
                       <% }
                       if(flag==0)
                       {%>
                       <th>subject1</th>
			<th>subject2</th>
                                <th>subject3</th>
			<th>subject4</th>
                        <th>subject5</th>
			
                       <%}
                       %>
			
			<th>SGPA</th>
			<th>CGPA</th>
			
		</tr>
	</thead>
	<tbody>
            <%
             while(info.next()&&result.next()){
            %>
             <tr class="gradeC">
		<td><%=info.getString(2)%></td>
		<td><%=info.getString(1)%></td>
		
		<td class="center"><%= result.getString(5)%></td>
		<td class="center"><%= result.getString(6)%></td>
		<td class="center"><%= result.getString(7)%></td>
		<td class="center"><%= result.getString(8)%></td>
                <td class="center"><%= result.getString(9)%></td>
		<td class="center"><%= result.getString(3)%></td>
		<td class="center"><%= result.getString(2)%></td>
		</tr>
            <%
             }
            %>
        </tbody>
	<tfoot>
		<tr>
			<th><input type="text" name="search_eno." placeholder="Search Enrollment" class="search_init" /></th>
			<th><input type="text" name="search_students" placeholder="Search Students" class="search_init" /></th>
			<th><input type="text" name="search_sb1" placeholder="Search  grades" class="search_init" /></th>
			<th><input type="text" name="search_sb2" placeholder="Search  grades" class="search_init" /></th>
			<th><input type="text" name="search_sb3" placeholder="Search grades" class="search_init" /></th>
			<th><input type="text" name="search_sb4" placeholder="Search  grades" class="search_init" /></th>
			<th><input type="text" name="search_sb5" placeholder="Search  grades" class="search_init" /></th>
			<th><input type="text" name="search_sgpa" placeholder="Search SGPA" class="search_init" /></th>
			<th><input type="text" name="search_cgpa" placeholder="Search CGPA" class="search_init" /></th>
			
		</tr>
	</tfoot>
</table>   
        </div>
        </div>
                        
	     
     
        <script type="text/javascript" language="javascript" src="resources/DataTables/media/support/syntax/js/shCore.js"></script>
   
    </body>
</html>

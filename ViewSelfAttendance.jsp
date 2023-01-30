
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Employee Management System</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<script language="javascript">
function checkField(page) {
	if(page.t2.value.length==0) {
		alert("from date must be selected");
		page.t2.focus();
		return false;
	}	
	if(page.t3.value.length==0) {
		alert("to date must be selected");
		page.t3.focus();
		return false;
	}	
	return true;
}
</script>
 <script language="javascript" type="text/javascript" src="datetimepicker.js">
</script>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><span><center>Employee Management System

</center></span></h1>
		
	</div>
	<div id="menu">
		<ul id="main">
			<li class="current_page_item"><a href="EditPersonalInfo.jsp">Edit Personal Info</a></li><td></td>
			<li><a href="EditDependentInfo.jsp">Edit Dependent Info</a></li><td></td>
			<li><a href="ApplyLeave.jsp">Apply Leave</a></li><td></td>
			<li><a href="ViewEmpProject.jsp">View Project</a></li><td></td>
			<li><a href="ViewRatings.jsp">View Ratings</a></li><td></td>
			<li><a href="ViewSelfAttendance.jsp">View Attendance & Payroll</a></li><td></td>
			<li><a href="AddEmpAttendance.jsp">Mark Attendance</a></li><td></td>
		 <li><a href="index.jsp">Logout</a></li><td></td>
			<td></td>
			
     
		</ul>
		
	</div>
	
</div>

<div id="wrapper">
	<!-- start page -->
	<div id="page">
		 <form name ="f1" method="post" action="ViewSelfAttendanceAction.jsp" onsubmit="return checkField(this);">
		<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			View Attendance & Pay Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("t1");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="right">
<tr><td><font size="3" color="black">Employee&nbsp;ID</td><td><input type="text" name="t1" size="30" value="<%=session.getAttribute("user").toString()%>" readonly/></td></tr>

<tr><td><b><font size="3" color="black">From&nbsp;Date</b></td><td><input name="t2" type="text" id="demo1" maxlength="25" size="20" class="c2" ><a href="javascript:NewCal('demo1','ddmmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
	  		<span class="descriptions"></span></td>
		  </td></tr>

<tr><td><b><font size="3" color="black">To&nbsp;Date</b></td><td><input name="t3" type="text" id="demo2" maxlength="25" size="20" class="c2" ><a href="javascript:NewCal('demo2','ddmmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
	  		<span class="descriptions"></span></td>
		  </td></tr>

<tr><td></td><td><input type="submit" value="Submit"></td>
</td></tr></table>
</form>
			</table>
			</center><br /><div class="post">
				
				<div class="entry">
					
				</div>
			</div>
		</div>
		<!-- end content -->
		<!-- start sidebars -->
		
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
</body>
</html>



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
	if(page.t1.value.length==0) {
		alert("Employee name cannot be empty");
		page.t1.focus();
		return false;
	}
	if(page.t2.value.length==0) {
		alert("Designation cannot be empty");
		page.t2.focus();
		return false;
	}
	if(page.t3.value.length==0) {
		alert("Qualification cannot be empty");
		page.t3.focus();
		return false;
	}
	if(page.t4.value.length==0) {
		alert("Experience details cannot be empty");
		page.t4.focus();
		return false;
	}
	if(page.t5.value.length==0) {
		alert("Email ID cannot be empty");
		page.t5.focus();
		return false;
	}
	var filter = /^([a-zA-Z0-9_\.\-])+\@([a-z]+\.)+(com)+$/;
    if (!filter.test(page.t5.value)) {
		window.alert('Please enter valid email address');
		page.t5.focus();
		return false;
	}
	if(page.t6.value.length==0)
	{
	alert("Please enter phone no");
	page.t6.focus();
	return false;
	}
	if(!page.t6.value.match(/^\d{10}$/)){
		window.alert("Valid phone no must be enter");
		page.t6.focus();
		return false;
	}
	if(page.t7.value.length==0) {
		alert("Address cannot be empty");
		page.t7.focus();
		return false;
	}
	if(page.t8.value.length==0) {
		alert("Password cannot be empty");
		page.t8.focus();
		return false;
	}
	if(page.t10.value.length==0) {
		alert("Salary field cannot be empty");
		page.t10.focus();
		return false;
	}
	return true;
}
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
			<li class="current_page_item"><a href="GeneratePay.jsp">Generate Payroll</a></li><td></td>
			<li><a href="InsertRecord.jsp">Insert Record</a></li><td></td>
			<li><a href="DeleteRecord.jsp">Delete Record</a></li><td></td>
			<li><a href="AssignEmployee.jsp">Assign Employee</a></li><td></td>
			<li><a href="ViewHREmployees.jsp">View Employees</a></li><td></td>
			<li><a href="AddHRAttendance.jsp">Add Attendance</a></li><td></td>
		 <li><a href="index.jsp">Logout</a></li><td></td>
			<td></td>
			
     
		</ul>
		
	</div>
	
</div>

<div id="wrapper">
	<!-- start page -->
	<div id="page">
		 <form name ="f1" method="post" action="InsertRecord" onsubmit="return checkField(this);">
		<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Insert Employee Record Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("t1");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="right">
<tr><td><font size="3" color="black">Employee&nbsp;Name</td><td><input type="text" name="t1" size="30"/></td></tr>
<tr><td><font size="3" color="black">Designation</td><td><input type="text" name="t2" size="40"/></td></tr>
<tr><td><font size="3" color="black">Qualification</td><td><input type="text" name="t3" size="40"/></td></tr>
<tr><td><font size="3" color="black">Experience&nbsp;Details</td><td><input type="text" name="t4" size="40"/></td></tr>
<tr><td><font size="3" color="black">Email&nbsp;ID</td><td><input type="text" name="t5" size="30"/></td></tr>
<tr><td><font size="3" color="black">Contact&nbsp;No</td><td><input type="text" name="t6" size="20"/></td></tr>
<tr><td><font size="3" color="black">Address</td><td><input type="text" name="t7" size="40"/></td></tr>
<tr><td><font size="3" color="black">Password</td><td><input type="password" name="t8" size="30"/></td></tr>
<tr><td><font size="3" color="black">User&nbsp;Type</td><td><select name="t9">
<option value="Manager">Manager</option>
<option value="HR">HR</option>
<option value="Employee">Employee</option>
<option value="Client">Client</option>
</select>
</td></tr>

<tr><td><font size="3" color="black">Salary</td><td><input type="text" name="t10" size="15"/></td></tr>

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



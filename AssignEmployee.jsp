<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBCon"%>
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
	if(page.t4.value.length==0) {
		alert("department name must be entered");
		page.t4.focus();
		return false;
	}	
	if(page.t5.value.length==0) {
		alert("project name must be entered");
		page.t5.focus();
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
			<li><a href="AssignEmployee.jsp">Assign Employee to Project</a></li><td></td>
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
		 <form name ="f1" method="post" action="AssignEmployee" onsubmit="return checkField(this);">
		<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Assign Employee to Project Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("t1");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="right">
<tr><td><font size="3" color="black">Choose&nbsp;Employee</td><td><select name="t1">
<%
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select Employee_ID,Employee_name from employees where usertype='Employee'");
	while(rs.next()){%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(1)+" - "+rs.getString(2)%></option>
	<%}%>
</select>
</td></tr>

<tr><td><font size="3" color="black">Assign&nbsp;To</td><td><select name="t2">
<%
	con = DBCon.getCon();
	stmt = con.createStatement();
	rs = stmt.executeQuery("select Employee_ID,Employee_name,usertype from employees where usertype='HR' or usertype='Manager'");
	while(rs.next()){%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(1)+" - "+rs.getString(2)+" - "+rs.getString(3)%></option>
	<%}%>
</select>
</td></tr>

<tr><td><font size="3" color="black">Choose&nbsp;Client</td><td><select name="t3">
<%
	con = DBCon.getCon();
	stmt = con.createStatement();
	rs = stmt.executeQuery("select Employee_ID,Employee_name from employees where usertype='Client'");
	while(rs.next()){%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
	<%}%>
</select>
</td></tr>

<tr><td><font size="3" color="black">Department&nbsp;Name</td><td><input type="text" name="t4" size="30"/></td></tr>

<tr><td><font size="3" color="black">Project&nbsp;Name</td><td><input type="text" name="t5" size="30"/></td></tr>

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



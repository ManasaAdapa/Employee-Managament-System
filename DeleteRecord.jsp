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
	<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Delete Employee Record Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("value");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="center" border="1">
			<tr><th><font size="" color="black">Employee ID</th>
			<th><font size="3" color="black">Employee Name</th>
			<th><font size="3" color="black">Designation</th>
			<th><font size="3" color="black">Qualification</th>
			<th><font size="3" color="black">Experience</th>
			<th><font size="3" color="black">Email ID</th>
			<th><font size="3" color="black">Contact No</th>
			<th><font size="3" color="black">Address</th>
			<th><font size="3" color="black">Password</th>
			<th><font size="3" color="black">UserType</th>
			<th><font size="3" color="black">Salary</th>
			<th><font size="3" color="black">Delete Record</th></tr>
<%
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from employees");
	while(rs.next()){%>
	<tr><td><font size="" color="black"><%=rs.getString(1)%></font></td>
	<td><font size="3" color="black"><%=rs.getString(2)%></font></td>
     <td><font size="3" color="black"><%=rs.getString(3)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(4)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(5)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(6)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(7)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(8)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(9)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(10)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(11)%></font></td>
	 <td><a href="DeleteRecord?t1=<%=rs.getString(1)%>"><font size="3" color="black">Click Here</a></td></tr>
	 <%}%>
</table>
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



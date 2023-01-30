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
			Generate Payroll Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("value");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="center" border="1">
			<tr><th><font size="" color="black">Employee Details</th>
			<th><font size="3" color="black">Payment Details</th>
			</tr>
<%
     String id = request.getParameter("t1");
	 String from = request.getParameter("t2");
	 String to = request.getParameter("t3");

	 java.util.Date d1 = new java.util.Date(from.trim());
	java.sql.Date from_date = new java.sql.Date(d1.getTime());

	d1 = new java.util.Date(to.trim());
	java.sql.Date to_date = new java.sql.Date(d1.getTime());

    String name = DBCon.getName(id);
	double salary = DBCon.getSalary(id);
	double count = 0;
	double sal_per_day = salary / 30;
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select count(*) from attendance where employee_id='"+id+"' and attendance_date between '"+from_date.toString()+"' and '"+to_date.toString()+"'");
	while(rs.next()){
		count = (double)rs.getInt(1);
	}
		%>
	<tr><td><font size="3" color="black">Employee ID</font></td>
	<td><font size="3" color="black"><%=id%></font></td></tr>
     <tr><td><font size="3" color="black">Employee Name</font></td>
	 <td><font size="3" color="black"><%=name%></font></td></tr>
	 <tr><td><font size="3" color="black">Net Salary</font></td>
	 <td><font size="3" color="black"><%=salary%></font></td></tr>

	 <tr><td><font size="3" color="black">From Date</font></td>
	 <td><font size="3" color="black"><%=from_date.toString()%></font></td></tr>

	 <tr><td><font size="3" color="black">To Date</font></td>
	 <td><font size="3" color="black"><%=to_date.toString()%></font></td></tr>

	 <tr><td><font size="3" color="black">Total Working Days</font></td>
	 <td><font size="3" color="black"><%=count%></font></td></tr>

	 <tr><td><font size="3" color="black">Amount Payable</font></td>
	  <td><font size="3" color="black"><%=(sal_per_day  * count)%></font></td></tr>
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



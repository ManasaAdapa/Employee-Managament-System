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
			<li class="current_page_item"><a href="ViewClientEmp.jsp">View Own Projects & Employees</a></li><td></td>
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
			View Employee Record Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("value");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="center" border="1">
			<tr><th><font size="3" color="black">Employee ID</th>
			<th><font size="3" color="black">HR/Manager ID</th>
			<th><font size="3" color="black">Client Name</th>
			<th><font size="3" color="black">Department Name</th>
			<th><font size="3" color="black">Project Name</th>
			<th><font size="3" color="black">Assigned Date</th></tr>
<%
String user = session.getAttribute("user").toString();
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from assignemployee where client_name='"+user+"'");
	while(rs.next()){%>
	<tr><td><font size="3" color="black"><%=rs.getString(1)+" - "+DBCon.getName(rs.getString(1))%></font></td>
	<td><font size="3" color="black"><%=rs.getString(2)+" - "+DBCon.getName(rs.getString(2))%></font></td>
     <td><font size="3" color="black"><%=rs.getString(3)+" - "+DBCon.getName(rs.getString(3))%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(4)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(5)%></font></td>
	 <td><font size="3" color="black"><%=rs.getString(6)%></font></td>
	</tr>
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



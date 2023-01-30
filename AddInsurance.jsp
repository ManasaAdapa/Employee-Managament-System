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
	if(page.t3.value.length==0) {
		alert("Sum Assured cannot be empty");
		page.t3.focus();
		return false;
	}	
	if(page.t4.value.length==0) {
		alert("Dependent details cannot be empty");
		page.t4.focus();
		return false;
	}	
	if(page.t5.value.length==0) {
		alert("Insurance company name cannot be empty");
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
			<li class="current_page_item"><a href="AddEmp.jsp">Add Employee Details</a></li><td></td>
			<li><a href="AddInsurance.jsp">Add Insurance Details</a></li><td></td>
		 <li><a href="index.jsp">Logout</a></li><td></td>
			<td></td>
			
     
		</ul>
		
	</div>
	
</div>

<div id="wrapper">
	<!-- start page -->
	<div id="page">
		 <form name ="f1" method="post" action="AddInsurance" onsubmit="return checkField(this);">
		<!-- start content -->
		<div id="content">
			<div class="flower"><center><h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Add Insurance Screen <h1></div>
			<br/>
			<%
			String value = request.getParameter("t1");
			if(value != null){
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.println("<center><font size=3 color=red>"+value+"</font></center>");
			}%>
	
			<br/>
		
		
			<table align="right">
<tr><td><font size="3" color="black">Employee&nbsp;ID</td><td><select name="t1">
<%
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select Employee_ID,Employee_name from employees");
	while(rs.next()){%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(1)+" - "+rs.getString(2)%></option>
	<%}%>
</select>
</td></tr>
<tr><td><font size="3" color="black">Num&nbsp;Dependents</td><td><select name="t2">
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</select>
</td></tr>
<tr><td><font size="3" color="black">Sum&nbsp;Assured</td><td><input type="text" name="t3" size="20"/></td></tr>
<tr><td><font size="3" color="black">Dependent&nbsp;Details</td><td><textarea name="t4" rows="10" cols="40"></textarea></td></tr>

<tr><td><font size="3" color="black">Insurance&nbsp;Company</td><td><input type="text" name="t5" size="40"/></td></tr>

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



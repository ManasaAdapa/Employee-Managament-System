package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.sql.Statement;
import java.util.ArrayList;
public class DBCon{
    private static Connection con;
	public static long normal,compress;
public static Connection getCon()throws Exception {
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_management","root","root");
    }catch(Exception e){
		e.printStackTrace();
	}
	return con;
}

public static String getName(String id)throws Exception{
    String msg="error";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select employee_name,usertype from employees where Employee_ID='"+id+"'");
    if(rs.next()){
	    msg = rs.getString(1)+" - "+rs.getString(2);		
    }
	rs.close();stmt.close();
	return msg;
}

public static double getSalary(String id)throws Exception{
    double salary = 0;
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select salary from employees where Employee_ID='"+id+"'");
    if(rs.next()){
	    salary = rs.getDouble(1);		
    }
	rs.close();stmt.close();
	return salary;
}

public static String addAttendance(String user)throws Exception {
	String msg = "error";
	java.util.Date dd = new java.util.Date();
	java.sql.Date time = new java.sql.Date(dd.getTime());
	con = getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from attendance where employee_id='"+user+"' and attendance_date='"+time.toString()+"'");
	if(rs.next()) {
		msg = "Attendance Already Marked";
	} else {
		PreparedStatement stat=con.prepareStatement("insert into attendance values(?,?)");
		stat.setString(1,user);
		stat.setDate(2,time);
		int i = stat.executeUpdate();
		if(i > 0)
			msg = "Attendance Successfully Marked";
	}
	return msg;
}

public static String ratings(String employee,String ratings,String id)throws Exception {
	String msg = "error";
	java.util.Date dd = new java.util.Date();
	java.sql.Date time = new java.sql.Date(dd.getTime());
	con = getCon();
	PreparedStatement stat=con.prepareStatement("insert into ratings values(?,?,?,?)");
	stat.setString(1,employee);
	stat.setString(2,ratings);
	stat.setString(3,id);
	stat.setDate(4,time);
	stat.executeUpdate();
	msg = "success";
	return msg;
}

public static String deleteEmpfromProject(String employee,String manager)throws Exception {
	String msg = "error";
	con = getCon();
	PreparedStatement stat=con.prepareStatement("delete from assignemployee where employee_id=? and assign_to=?");
	stat.setString(1,employee);
	stat.setString(2,manager);
	stat.executeUpdate();
	msg = "success";
	return msg;
}
public static String employeeAssign(String eid,String assignto,String client,String dept,String project)throws Exception {
	String msg = "error";
	java.util.Date dd = new java.util.Date();
	java.sql.Date time = new java.sql.Date(dd.getTime());
	con = getCon();
	PreparedStatement stat=con.prepareStatement("insert into assignemployee values(?,?,?,?,?,?)");
	stat.setString(1,eid);
	stat.setString(2,assignto);
	stat.setString(3,client);
	stat.setString(4,dept);
	stat.setString(5,project);
	stat.setDate(6,time);
	int i=stat.executeUpdate();
	stat.close();
	con.close();
	msg = "success";
	return msg;
}

public static String applyLeave(String id,String from_date,String to_date,String reason)throws Exception {
	String msg = "error";
	java.util.Date dd = new java.util.Date();
	java.sql.Date time = new java.sql.Date(dd.getTime());
	con = getCon();
	PreparedStatement stat=con.prepareStatement("insert into leaveapplication values(?,?,?,?,?,?,?)");
	stat.setString(1,id);
	stat.setString(2,from_date);
	stat.setString(3,to_date);
	stat.setString(4,reason);
	stat.setDate(5,time);
	stat.setString(6,"Pending");
	stat.setString(7,"Pending");
	int i=stat.executeUpdate();
	stat.close();
	con.close();
	msg = "success";
	return msg;
}


public static String addInsurance(String id,String dependent,String sum,String details,String company)throws Exception {
	String msg = "error";
	java.util.Date dd = new java.util.Date();
	java.sql.Timestamp time = new java.sql.Timestamp(dd.getTime());
	con = getCon();
	PreparedStatement stat=con.prepareStatement("insert into insurance values(?,?,?,?,?,?)");
	stat.setString(1,id);
	stat.setString(2,dependent);
	stat.setString(3,sum);
	stat.setString(4,details);
	stat.setString(5,company);
	stat.setTimestamp(6,time);
	int i=stat.executeUpdate();
	stat.close();
	con.close();
	msg = "success";
	return msg;
}

public static String deleteRecord(String id)throws Exception {
	String msg = "error";
	con = getCon();
	PreparedStatement stat=con.prepareStatement("delete from employees where employee_id=?");
	stat.setString(1,id);
	int i=stat.executeUpdate();
	if(i > 0)
		msg = "success";
	return msg;
}

public static String approveLeave(String id,String fdate,String manager_id)throws Exception {
	String msg = "error";
	con = getCon();
	PreparedStatement stat=con.prepareStatement("update leaveapplication set approved_manager=?,status=? where approved_manager=? and status=? and employee_id=? and reason=?");
	stat.setString(1,manager_id);
	stat.setString(2,"Accepted");
	stat.setString(3,"Pending");
	stat.setString(4,"Pending");
	stat.setString(5,id);
	stat.setString(6,fdate);
	stat.executeUpdate();
	msg = "success";
	return msg;
}


public static String editInsurance(String id,String num_dependent,String details)throws Exception {
	String msg = "error";
	con = getCon();
	PreparedStatement stat=con.prepareStatement("update insurance set num_dependents=?,dependent_details=? where Employee_ID=?");
	stat.setString(1,num_dependent);
	stat.setString(2,details);
	stat.setString(3,id);
	stat.executeUpdate();
	msg = "success";
	return msg;
}
public static String editEmp(String id,String name,String designation,String qualification,String experience,String email,String contact,String address,String password)throws Exception {
	String msg = "error";
	con = getCon();
	PreparedStatement stat=con.prepareStatement("update employees set Employee_name=?,designation=?,qualification=?,experience_details=?,email_id=?,contact_no=?,address=?,password=? where Employee_ID=?");
	stat.setString(1,name);
	stat.setString(2,designation);
	stat.setString(3,qualification);
	stat.setString(4,experience);
	stat.setString(5,email);
	stat.setString(6,contact);
	stat.setString(7,address);
	stat.setString(8,password);
	stat.setString(9,id);
	int i=stat.executeUpdate();
	stat.close();
	con.close();
	msg = "success";
    return msg;
}

public static String addEmp(String name,String designation,String qualification,String experience,String email,String contact,String address,String password, String type,String salary)throws Exception{
	String msg = "error";
	int id = 0;
	con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select count(*) from employees");
    if(rs.next()){
       id = rs.getInt(1);
    }
	id = id + 1;
	PreparedStatement stat=con.prepareStatement("insert into employees values(?,?,?,?,?,?,?,?,?,?,?)");
	stat.setInt(1,id);
	stat.setString(2,name);
	stat.setString(3,designation);
	stat.setString(4,qualification);
	stat.setString(5,experience);
	stat.setString(6,email);
	stat.setString(7,contact);
	stat.setString(8,address);
	stat.setString(9,password);
	stat.setString(10,type);
	stat.setString(11,salary);
	int i=stat.executeUpdate();
	stat.close();
	rs.close();stmt.close();con.close();
    return id+"";
}

public static String userLogin(String input[])throws Exception{
    String msg="invalid login";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select usertype,employee_name from employees where Employee_ID='"+input[0]+"' && password='"+input[1]+"'");
    if(rs.next()){
	    msg = rs.getString(1)+","+rs.getString(2);		
    }
	rs.close();stmt.close();
	return msg;
}
}

package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddEmp extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String name=request.getParameter("t1").trim();
	String designation=request.getParameter("t2").trim();
	String qualification=request.getParameter("t3").trim();
	String experience=request.getParameter("t4").trim();
	String email=request.getParameter("t5").trim();
	String contact=request.getParameter("t6").trim();
	String address=request.getParameter("t7").trim();
	String password=request.getParameter("t8").trim();
	String type=request.getParameter("t9").trim();
	String salary=request.getParameter("t10").trim();
	try{
		String res = DBCon.addEmp(name,designation,qualification,experience,email,contact,address,password,type,salary);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("AddEmp.jsp?t1=Employee details added with ID = "+res);
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("AddEmp.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

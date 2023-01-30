package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddEmptoProject extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String eid=request.getParameter("t1").trim();
	String assignto=request.getParameter("t2").trim();
	String client=request.getParameter("t3").trim();
	String dept=request.getParameter("t4").trim();
	String project=request.getParameter("t5").trim();
	
	try{
		String res = DBCon.employeeAssign(eid,assignto,client,dept,project);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("AddEmptoProject.jsp?t1=Employee assigned to project "+project);
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("AddEmptoProject.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditPersonalInfo extends HttpServlet {
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
	HttpSession session=request.getSession();
	String id = session.getAttribute("user").toString();
	try{
		String res = DBCon.editEmp(id,name,designation,qualification,experience,email,contact,address,password);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("EditPersonalInfo.jsp?t1=Your details edited successfully");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("EditPersonalInfo.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

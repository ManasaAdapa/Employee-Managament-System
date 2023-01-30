package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddHRAttendance extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	HttpSession session=request.getSession();
	try{
		String user = session.getAttribute("user").toString();
		String res = DBCon.addAttendance(user);
		RequestDispatcher rd=request.getRequestDispatcher("AddHRAttendance.jsp?t1="+res);
		rd.forward(request, response);
		
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

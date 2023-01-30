package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ApplyLeave extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String id=request.getParameter("t1").trim();
	String from_date=request.getParameter("t2").trim();
	String to_date=request.getParameter("t3").trim();
	String reason=request.getParameter("t4").trim();
	
	try{
		String res = DBCon.applyLeave(id,from_date,to_date,reason);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("ApplyLeave.jsp?t1=Your leave application submitted to manager");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("ApplyLeave.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddInsurance extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String id=request.getParameter("t1").trim();
	String dependent=request.getParameter("t2").trim();
	String sum=request.getParameter("t3").trim();
	String details=request.getParameter("t4").trim();
	String company=request.getParameter("t5").trim();
	try{
		String res = DBCon.addInsurance(id,dependent,sum,details,company);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("AddInsurance.jsp?t1=Insuranvce details added with ID = "+id);
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("AddInsurance.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

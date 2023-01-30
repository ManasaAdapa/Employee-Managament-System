package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ApproveLeaves extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();

	String id=request.getParameter("t1").trim();
	String fdate=request.getParameter("t2").trim();
	
	
	try{
		HttpSession session=request.getSession();
	     String manager_id = session.getAttribute("user").toString();
		String res = DBCon.approveLeave(id,fdate,manager_id);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("ApproveLeaves.jsp?t1=Leave details approved");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("ApproveLeaves.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

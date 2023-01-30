package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GiveRatings extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();

	String employee=request.getParameter("t1").trim();
	String ratings=request.getParameter("t2").trim();
	try{
		HttpSession session=request.getSession();
	    String id = session.getAttribute("user").toString();
		String res = DBCon.ratings(employee,ratings,id);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("GiveRatings.jsp?t1=Ratings saved in database");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("GiveRatings.jsp?t1="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

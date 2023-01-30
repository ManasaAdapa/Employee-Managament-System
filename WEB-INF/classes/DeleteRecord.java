package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteRecord extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	String name=request.getParameter("t1").trim();
	
	try{
		String res = DBCon.deleteRecord(name);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("DeleteRecord.jsp?value=Employee details deleted");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("DeleteRecord.jsp?value="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

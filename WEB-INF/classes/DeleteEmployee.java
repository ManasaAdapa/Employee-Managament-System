package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteEmployee extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	String employee=request.getParameter("t1").trim();
	String manager=request.getParameter("t2").trim();
	try{
		String res = DBCon.deleteEmpfromProject(employee,manager);
		if(!res.equals("error")){
			RequestDispatcher rd=request.getRequestDispatcher("DeleteEmpfromProject.jsp?value=Employee details deleted from project");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("DeleteEmpfromProject.jsp?value="+res);
			rd.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

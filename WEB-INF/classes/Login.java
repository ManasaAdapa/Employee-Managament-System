package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Login extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String user=request.getParameter("t1");
	String pass=request.getParameter("t2");
	try{
		if (user.equals("admin") && pass.equals("admin")) {
			RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1=Welcome "+user);
			rd.forward(request, response);
		} else {
			String input[] = {user,pass};
			String array[] = DBCon.userLogin(input).split(",");
			String msg = array[0];
			if(msg.equals("HR")){
				session.setAttribute("user",user);
				session.setAttribute("type",msg);
				RequestDispatcher rd=request.getRequestDispatcher("HRScreen.jsp?t1=Welcome "+array[1]);
				rd.forward(request, response);
			}
			if(msg.equals("Manager")){
				session.setAttribute("user",user);
				session.setAttribute("type",msg);
				RequestDispatcher rd=request.getRequestDispatcher("ManagerScreen.jsp?t1=Welcome "+array[1]);
				rd.forward(request, response);
			}
			if(msg.equals("Employee")){
				session.setAttribute("user",user);
				session.setAttribute("type",msg);
				RequestDispatcher rd=request.getRequestDispatcher("EmployeeScreen.jsp?t1=Welcome "+array[1]);
				rd.forward(request, response);
			}
			if(msg.equals("Client")){
				session.setAttribute("user",user);
				session.setAttribute("type",msg);
				RequestDispatcher rd=request.getRequestDispatcher("ClientScreen.jsp?t1=Welcome "+array[1]);
				rd.forward(request, response);
			}
			else{
				response.sendRedirect("Login.jsp?t1=Invalid User");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}

}

package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBOperation;
import dao.MyDBConnection;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("name");
		String pwd_01 = request.getParameter("pwd");
		String pwd_02 = request.getParameter("refill");
		MyDBConnection myConn = null;
		DBOperation DBO = null;
		if (pwd_01.equals(pwd_02)) {
			myConn = new MyDBConnection();
			DBO = new DBOperation(myConn);
			DBO.insertData(username, pwd_01, 0);
			DBO.closeStatement();
			myConn.closeMyConnection();
			PrintWriter out = response.getWriter();
			out.print("<script>alert('×¢²á³É¹¦!');window.location.href='login.jsp'</script>");
			out.flush();
			out.close();
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('×¢²áÊ§°Ü!');window.location.href='register.jsp'</script>");
			out.flush();
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

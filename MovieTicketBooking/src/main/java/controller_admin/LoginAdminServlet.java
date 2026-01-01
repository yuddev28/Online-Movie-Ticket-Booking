package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/login")
public class LoginAdminServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/admin/login-admin.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		if(username == null || username.isBlank()) {
			backToLoginPage("Thiếu tên đăng nhập.", request, response);
			return;
		}
		String password = request.getParameter("password");
		if(password == null || password.isBlank()) {
			backToLoginPage("Thiếu mật khẩu.", request, response);
			return;
		}
		doGet(request, response);
	}

	private void backToLoginPage(String message, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("loginError", message);
		doGet(request, response);
	}
}

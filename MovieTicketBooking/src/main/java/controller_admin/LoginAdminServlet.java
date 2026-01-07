package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;
import utils.AuthUtils;

import java.io.IOException;

@WebServlet("/login-admin")
public class LoginAdminServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/admin/login-admin.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		if(username == null || username.isBlank()) {
			backToLoginPage("Thiếu tên đăng nhập", request, response);
			return;
		}
		String password = request.getParameter("password");
		if(password == null || password.isBlank()) {
			backToLoginPage("Thiếu mật khẩu", request, response);
			return;
		}
		User admin = AuthUtils.login(username, password);
		if(admin == null) {
			backToLoginPage("Tài khoản không tồn tại", request, response);
			return;
		}
		if(!Role.ADMIN.equals(admin.getRole())) {
			backToLoginPage("Tài khoản không có quyền truy cập", request, response);
			return;
		}
		HttpSession session = request.getSession(true);
		session.setAttribute("admin", admin);
		response.sendRedirect(request.getContextPath() + "/admin/movies");
	}

	private void backToLoginPage(String message, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("loginError", message);
		doGet(request, response);
	}
}

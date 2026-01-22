package controller_admin;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;

@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		if(session == null || session.getAttribute("admin") == null) {
			res.sendRedirect(req.getContextPath() + "/login-admin");
			return;
		}
		User admin = (User) session.getAttribute("admin");
		if(!Role.ADMIN.equals(admin.getRole())) {
			res.sendRedirect(req.getContextPath() + "/login-admin");
			return;
		}
		chain.doFilter(req, res);
	}

}

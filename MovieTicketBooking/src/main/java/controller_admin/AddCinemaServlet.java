package controller_admin;

import java.io.IOException;

import dao.CinemaDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cinema;

@WebServlet("/admin/cinema/add")
public class AddCinemaServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-addcinema.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handlerAdd(request, response);
		response.sendRedirect(request.getContextPath() + "/admin/cinemas");
	}
	
	private void handlerAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			if(name == null || name.isBlank()) {
				backToAddPage(request, response, "Thiếu tên rạp");
				return;
			}
			String address = request.getParameter("address");
			if(address == null || address.isBlank()) {
				backToAddPage(request, response, "Thiếu địa chỉ");
				return;
			}
		    Cinema cm = new Cinema(name, address);
		    boolean res = new CinemaDAO().addCinema(cm);
		    // Put message to session
		    HttpSession session = request.getSession();
		    if(res) {
			    session.setAttribute("cinemaMessage", "Thêm rạp thành công!");
		    }else {
		    	session.setAttribute("cinemaMessage", "Thêm rạp thất bại!");
		    }
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
	}

	private void backToAddPage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
		request.setAttribute("errorMessage", message);
		doGet(request, response);
	}

}

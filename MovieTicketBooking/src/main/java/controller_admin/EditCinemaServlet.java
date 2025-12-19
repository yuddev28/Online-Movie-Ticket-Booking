package controller_admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cinema;

import java.io.IOException;
import java.util.List;

import dao.CinemaDAO;


@WebServlet("/admin/cinema/edit")
public class EditCinemaServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-editcinema.jsp");
		// Get movie by id and put it to view
		String idPara = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idPara);
		} catch(NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/cinemas");
			e.printStackTrace();
		}
		Cinema cinema = new CinemaDAO().getCinemaById(id);
		if(cinema == null) {
			request.getSession().setAttribute("cinemaMessage", "Không tìm thấy rạp.");
			response.sendRedirect(request.getContextPath() + "/admin/cinemas");
			return;
		}
		request.setAttribute("cinema", cinema);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handlerUpdate(request, response);
		response.sendRedirect(request.getContextPath() + "/admin/cinemas");
	}
	
	// Handler update movie
	private void handlerUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		try {
			// Get parameter and check error
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			if(name == null || name.isBlank()) {
				backToEditPage(request, response, "Thiếu tên rạp");
				return;
			}
			String address = request.getParameter("address");
			if(address == null || address.isBlank()) {
				backToEditPage(request, response, "Thiếu địa chỉ");
				return;
			}
		    Cinema cm = new Cinema(name, address);
		    int update = new CinemaDAO().updateCinema(id, cm);
		    // Put message to session
		    HttpSession session = request.getSession();
			// check movie have update in database
		    if(update > 0) {
			    session.setAttribute("cinemaMessage", "Cập nhật thành công!");
		    } else {
		    	session.setAttribute("cinemaMessage", "Không cập nhật!");
		    }
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	// Back to edit page for edit again
	private void backToEditPage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
		request.setAttribute("errorMessage", message);
		doGet(request, response);
	}

}

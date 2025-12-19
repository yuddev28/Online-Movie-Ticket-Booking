package controller_admin;

import java.io.IOException;
import java.util.List;

import dao.CinemaDAO;
import dao.ICinemaDAO;
import dao.IMovieDAO;
import dao.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cinema;
import model.Movie;

@WebServlet("/admin/cinemas")
public class ListCinemasServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-cinemas.jsp");
		List<Cinema> cinemas = new CinemaDAO().getAllCinema();
		request.setAttribute("listCinemas", cinemas);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String message = (String) session.getAttribute("cinemaMessage");
		if(message != null) session.setAttribute("cinemaMessage", null);
		doGet(request, response);
	}

}
package controller_admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Movie;

import java.io.IOException;
import java.util.List;

import dao.IMovieDAO;
import dao.MovieDAO;

@WebServlet("/admin/movies")
public class ListMoviesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-movies.jsp");
		IMovieDAO mDAO = new MovieDAO();
		List<Movie> movies = mDAO.getAllMovies();
		request.setAttribute("listMovies", movies);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Remove all message in request and session
		request.setAttribute("errorMessage", null);
		HttpSession session = request.getSession();
		String message = (String) session.getAttribute("movieMessage");
		if(message != null) session.setAttribute("movieMessage", null);
		doGet(request, response);
	}

}

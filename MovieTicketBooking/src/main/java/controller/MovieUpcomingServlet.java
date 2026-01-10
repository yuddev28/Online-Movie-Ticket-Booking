package controller;

import dao.IMovieDAO;
import dao.MovieDAO;
import model.Movie;
import model.MovieStatus;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/upcoming")
public class MovieUpcomingServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        IMovieDAO dao = new MovieDAO();
        List<Movie> fullListUpcoming = dao.getMoviesWithStatus(MovieStatus.COMING_SOON);
        
        request.setAttribute("fullListUpcoming", fullListUpcoming);
        request.getRequestDispatcher("/WEB-INF/view/movieUpcoming.jsp").forward(request, response);
    }
}
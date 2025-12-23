package controller;

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

// URL này sẽ được gọi khi bấm nút "Xem Tất Cả" ở mục Phim Sắp Chiếu
@WebServlet(name = "MovieUpcomingServlet", urlPatterns = {"/upcoming"})
public class MovieUpcomingServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MovieDAO dao = new MovieDAO();
        List<Movie> allMovies = dao.getAllMovies();
        List<Movie> fullListUpcoming = new ArrayList<>();

        if (allMovies != null) {
            for (Movie m : allMovies) {
                if (m.getMovieStatus() == MovieStatus.COMING_SOON) {
                    fullListUpcoming.add(m);
                }
            }
        }
        
        request.setAttribute("fullListUpcoming", fullListUpcoming);
        request.getRequestDispatcher("/WEB-INF/view/movieUpcoming.jsp").forward(request, response);
    }
}
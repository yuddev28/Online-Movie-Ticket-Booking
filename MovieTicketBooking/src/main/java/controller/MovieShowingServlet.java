package controller;

// --- PHẦN IMPORT QUAN TRỌNG (ĐỪNG BỎ QUA) ---
import dao.MovieDAO;
import model.Movie;
import model.MovieStatus;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException; // Nếu lỗi dòng này, đổi thành javax.servlet.ServletException
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// ---------------------------------------------

@WebServlet(name = "MovieShowingServlet", urlPatterns = {"/showing"})
public class MovieShowingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MovieDAO dao = new MovieDAO();
        List<Movie> allMovies = dao.getAllMovies();
        List<Movie> fullListShowing = new ArrayList<>();

        if (allMovies != null) {
            for (Movie m : allMovies) {
                // Lấy danh sách phim ĐANG CHIẾU
                if (m.getMovieStatus() == MovieStatus.NOW_SHOWING) {
                    fullListShowing.add(m);
                }
            }
        }
        
        request.setAttribute("fullListShowing", fullListShowing);
        request.getRequestDispatcher("/WEB-INF/view/movieShowing.jsp").forward(request, response);
    }
}
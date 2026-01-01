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

// URL này sẽ được gọi khi bấm vào menu "Phim"
@WebServlet(name = "MoviesServlet", urlPatterns = {"/movies"})
public class MoviesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Gọi DAO lấy TẤT CẢ phim
        MovieDAO dao = new MovieDAO();
        List<Movie> allMovies = dao.getAllMovies();
        
        // 2. Tạo 2 danh sách chứa
        List<Movie> listShowing = new ArrayList<>();
        List<Movie> listUpcoming = new ArrayList<>();

        // 3. Phân loại phim
        if (allMovies != null) {
            for (Movie m : allMovies) {
                if (m.getMovieStatus() == MovieStatus.NOW_SHOWING) {
                    listShowing.add(m);
                } else if (m.getMovieStatus() == MovieStatus.COMING_SOON) {
                    listUpcoming.add(m);
                }
            }
        }

        // 4. Gửi dữ liệu sang trang JSP
        request.setAttribute("listShowing", listShowing);
        request.setAttribute("listUpcoming", listUpcoming);
        
        // 5. Chuyển hướng về trang giao diện
        request.getRequestDispatcher("/WEB-INF/view/movies.jsp").forward(request, response);
    }
}
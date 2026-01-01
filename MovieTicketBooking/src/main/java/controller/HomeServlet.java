package controller;

import dao.MovieDAO;
import model.Movie;
import model.MovieStatus;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Định nghĩa URL /home cho trang chủ
@WebServlet(name = "HomeServlet", urlPatterns = {"/home","/index"})
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Khởi tạo DAO
        MovieDAO dao = new MovieDAO();
        
        // 2. Lấy toàn bộ danh sách phim từ Database
        // Hàm này giờ đây sẽ chạy câu lệnh "SELECT * FROM movies" trong MovieDAO
        List<Movie> allMovies = dao.getAllMovies();
        
        // 3. Chuẩn bị 2 danh sách để chứa phim sau khi lọc
        List<Movie> listShowing = new ArrayList<>();
        List<Movie> listUpcoming = new ArrayList<>();

        // 4. Phân loại phim dựa trên trạng thái (Enum)
        if (allMovies != null && !allMovies.isEmpty()) {
            for (Movie m : allMovies) {
                // Kiểm tra null để tránh lỗi nếu dữ liệu DB bị thiếu status
                if (m.getMovieStatus() != null) {
                    if (m.getMovieStatus() == MovieStatus.NOW_SHOWING) {
                        listShowing.add(m);
                    } else if (m.getMovieStatus() == MovieStatus.COMING_SOON) {
                        listUpcoming.add(m);
                    }
                }
            }
        }

// --- XỬ LÝ NGẪU NHIÊN VÀ GIỚI HẠN 5 PHIM ---
        
        // 1. Xáo trộn danh sách
        Collections.shuffle(listShowing);
        Collections.shuffle(listUpcoming);

        // 2. Cắt lấy tối đa 5 phim (đề phòng danh sách < 5)
        List<Movie> top5Showing = listShowing.subList(0, Math.min(listShowing.size(), 5));
        List<Movie> top5Upcoming = listUpcoming.subList(0, Math.min(listUpcoming.size(), 5));

        // 3. Gửi danh sách rút gọn sang home.jsp
        request.setAttribute("listShowing", top5Showing);
        request.setAttribute("listUpcoming", top5Upcoming);
        
        request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Nếu có request POST gửi đến trang	 chủ, chuyển nó sang xử lý như GET
        doGet(request, response);
    }
}
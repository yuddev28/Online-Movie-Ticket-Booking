package controller;

import dao.CinemaDAO;
import model.Cinema;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// URL này dùng để truy cập trang danh sách rạp
@WebServlet(name = "TheaterServlet", urlPatterns = {"/theaters"})
public class TheaterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Gọi DAO lấy danh sách tất cả các rạp
        CinemaDAO cinemaDAO = new CinemaDAO();
        List<Cinema> listCinemas = cinemaDAO.getAllCinema();
        
        // 2. Gửi dữ liệu sang trang JSP
        request.setAttribute("listCinemas", listCinemas);
        
        // 3. Chuyển hướng về giao diện
        request.getRequestDispatcher("/WEB-INF/view/theater.jsp").forward(request, response);
    }
}
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

@WebServlet("/theaters")
public class TheaterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // lấy danh sách tất cả các rạp
        CinemaDAO cinemaDAO = new CinemaDAO();
        List<Cinema> listCinemas = cinemaDAO.getAllCinema();
        
        // Gửi dữ liệu sang trang JSP
        request.setAttribute("listCinemas", listCinemas);
        
        // Chuyển hướng về giao diện
        request.getRequestDispatcher("/WEB-INF/view/theater.jsp").forward(request, response);
    }
}
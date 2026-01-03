package controller;

import dao.ShowTimeDAO;
import dao.TicketDAO;
import model.ShowTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SelectSeatServlet", urlPatterns = {"/select-seat"})
public class SelectSeatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra login lại cho chắc
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        try {
            int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
            
            ShowTimeDAO stDao = new ShowTimeDAO();
            TicketDAO tkDao = new TicketDAO(); // Dùng TicketDAO để lấy ghế đã đặt
            
            // Lấy thông tin suất chiếu (để biết giá tiền, phòng nào, rạp nào)
            ShowTime showTime = stDao.getShowTimeById(showtimeId);
            
            // Lấy danh sách ghế đã bị người khác đặt (ví dụ: ["A1", "B5"])
            List<String> bookedSeats = tkDao.getBookedSeats(showtimeId);

            request.setAttribute("showTime", showTime);
            request.setAttribute("bookedSeats", bookedSeats);
            
            request.getRequestDispatcher("/WEB-INF/view/select-seat.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("home");
        }
    }
}
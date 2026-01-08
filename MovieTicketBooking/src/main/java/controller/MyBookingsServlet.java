package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.Ticket;
import dao.TicketDAO;
import java.io.IOException;
import java.util.List;
import java.util.Collections;

@WebServlet("/my-bookings")
public class MyBookingsServlet extends HttpServlet {
    private TicketDAO ticketDAO;

    @Override
    public void init() {
        ticketDAO = new TicketDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user"); // Giả sử user đã login và lưu trong session

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy danh sách vé của user từ CSDL
        List<Ticket> ticketList = ticketDAO.getTicketsByUserId(user.getId());
        
        // Đảo ngược danh sách để vé mới nhất hiện lên đầu (tùy chọn)
        Collections.reverse(ticketList);

        request.setAttribute("ticketList", ticketList);
        request.getRequestDispatcher("/WEB-INF/view/my-bookings.jsp").forward(request, response);
    }
}
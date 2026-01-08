package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ticket;
import model.TicketStatus;
import dao.TicketDAO;
import java.io.IOException;

@WebServlet("/cancel-ticket")
public class CancelTicketServlet extends HttpServlet {
    private TicketDAO ticketDAO;

    @Override
    public void init() {
        ticketDAO = new TicketDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            
            // 1. Lấy vé từ DB
            Ticket ticket = ticketDAO.getTicketById(ticketId);
            
            if (ticket != null && ticket.getStatus() != TicketStatus.CANCELLED) {
                // 2. Cập nhật trạng thái sang CANCELLED
                // Logic trong TicketDAO sẽ tự động set user của các ghế thành NULL
                ticketDAO.updateTicketStatus(ticket, TicketStatus.CANCELLED);
                
                request.getSession().setAttribute("message", "Hủy vé thành công!");
            } else {
                request.getSession().setAttribute("error", "Vé không tồn tại hoặc đã bị hủy.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Có lỗi xảy ra khi hủy vé.");
        }

        // Quay lại trang danh sách
        response.sendRedirect("my-bookings");
    }
}
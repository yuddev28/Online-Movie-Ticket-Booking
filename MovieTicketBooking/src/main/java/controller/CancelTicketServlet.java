package controller;

import dao.TicketDAO;
import model.Ticket;
import model.TicketStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cancel-ticket")
public class CancelTicketServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// Lấy ID vé từ form
			int ticketId = Integer.parseInt(request.getParameter("ticketId"));

			TicketDAO ticketDAO = new TicketDAO();

			// Lấy vé từ DB (Bạn cần đảm bảo TicketDAO có hàm getTicketById)
			Ticket ticket = ticketDAO.getTicketById(ticketId);
			// Nếu chưa có hàm này, xem chú thích bên dưới (*)

			if (ticket != null && ticket.getStatus() != TicketStatus.CANCELLED) {
				// Thực hiện hủy vé
				// Logic trong TicketDAO sẽ tự động set user của ghế về NULL
				ticketDAO.updateTicketStatus(ticket, TicketStatus.CANCELLED);

				request.getSession().setAttribute("message", "Hủy vé thành công!");
			} else {
				request.getSession().setAttribute("error", "Vé không tồn tại hoặc đã hủy.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Lỗi khi hủy vé!");
		}
		String referer = request.getHeader("Referer");
		// Quay lại trang Profile
		response.sendRedirect(referer != null ? referer : "profile");
	}
}
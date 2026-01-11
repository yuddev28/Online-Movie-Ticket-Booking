package controller;

import dao.ITicketDAO;
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
			int ticketId = Integer.parseInt(request.getParameter("ticketId"));

			ITicketDAO ticketDAO = new TicketDAO();
			Ticket ticket = ticketDAO.getTicketById(ticketId);

			if (ticket != null && ticket.getStatus() != TicketStatus.CANCELLED) {
				// Thực hiện hủy vé
				ticketDAO.updateTicketStatus(ticket, TicketStatus.CANCELLED);

				request.getSession().setAttribute("message", "Hủy vé thành công!");
			} else {
				request.getSession().setAttribute("error", "Vé không tồn tại hoặc đã hủy.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Lỗi khi hủy vé!");
		}
		// Quay lại trang Profile
		response.sendRedirect("profile");
	}
}
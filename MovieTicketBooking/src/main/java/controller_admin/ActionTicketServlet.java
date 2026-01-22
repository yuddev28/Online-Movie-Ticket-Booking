package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Ticket;
import model.TicketStatus;

import java.io.IOException;

import dao.ITicketDAO;
import dao.TicketDAO;

@WebServlet("/admin/ticket/action")
public class ActionTicketServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int ticketId = Integer.parseInt(id);
		Ticket ticket = new Ticket();
		ticket.setId(ticketId);
		String action = request.getParameter("action");
		ITicketDAO dao = new TicketDAO();
		
		HttpSession session = request.getSession();
		// Check action to ticket pay or check in
		if("pay".equalsIgnoreCase(action)) {
			TicketStatus newStatus = TicketStatus.PAID;
			dao.updateTicketStatus(ticket, newStatus);
			session.setAttribute("ticketMessage", "Đã xác nhận thanh toán thành công");
		} else if("checkin".equals(action)) {
			TicketStatus newStatus = TicketStatus.CHECKEDIN;
			dao.updateTicketStatus(ticket, newStatus);
			session.setAttribute("ticketMessage", "Đã check in thành công");
		}
		
		response.sendRedirect(request.getContextPath() + "/admin/tickets");
	}

}

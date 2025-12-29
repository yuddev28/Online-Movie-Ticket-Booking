package controller_admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Ticket;

import java.io.IOException;
import java.util.List;

import dao.ITicketDAO;
import dao.TicketDAO;


@WebServlet("/admin/tickets")
public class ListTicketsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-tickets.jsp");
		ITicketDAO dao = new TicketDAO();
		List<Ticket> listTickets = dao.getAllTickets();
		request.setAttribute("listTickets", listTickets);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Remove all message in request and session
		HttpSession session = request.getSession();
		String message = (String) session.getAttribute("ticketMessage");
		if(message != null) session.setAttribute("ticketMessage", null);
		request.setAttribute("errorMessage", null);
		doGet(request, response);
	}
	
}

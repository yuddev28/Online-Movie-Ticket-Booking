package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ticket;

import java.io.IOException;
import java.util.List;

import dao.ITicketDAO;
import dao.TicketDAO;


@WebServlet("/admin/ticket/search")
public class SearchTicketServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchInput = (String) request.getParameter("searchInput");
		if(searchInput == null || searchInput.isBlank()) {
			response.sendRedirect(request.getContextPath() + "/admin/tickets");
			return;
		}
		// Get list ticket and filter by uid
		ITicketDAO dao = new TicketDAO();
		List<Ticket> listTickets = dao.getAllTickets();
		List<Ticket> newList = listTickets.stream().filter(t -> t.getUid().contains(searchInput)).toList();
		request.setAttribute("listTickets", newList);
		request.getRequestDispatcher("/admin/tickets").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

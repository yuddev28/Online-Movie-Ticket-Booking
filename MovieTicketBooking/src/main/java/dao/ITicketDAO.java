package dao;

import java.util.List;

import model.Ticket;
import model.TicketStatus;
import model.User;

public interface ITicketDAO {
	List<Ticket> getTicketsByUserId(int userId);
	List<Ticket> getAllTickets();
	Ticket getTicketById(int ticketId);
	boolean saveBooking(User user, int showtimeId, String[] seats, double totalPrice, String paymentMethod);
	boolean updateTicketStatus(Ticket ticket, TicketStatus newStatus);
}

package dao;

import java.util.List;

import model.Ticket;
import model.TicketStatus;
import model.User;

public interface ITicketDAO {
	List<Ticket> getTicketsByUserId(int userId);
	List<Ticket> getAllTickets();
	void addTicket(Ticket ticket);
	void updateTicketStatus(Ticket ticket, TicketStatus newStatus);
	public boolean saveBooking(User user, int showtimeId, String[] seats, double totalPrice, String paymentMethod);
	public List<String> getBookedSeats(int showtimeId);
	Ticket getTicketById(int ticketId);
}

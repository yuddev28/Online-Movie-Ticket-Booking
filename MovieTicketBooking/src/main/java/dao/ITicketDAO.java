package dao;

import java.util.List;

import model.Ticket;
import model.TicketStatus;

public interface ITicketDAO {
	List<Ticket> getTicketsByUserId(int userId);
	List<Ticket> getAllTickets();
	void addTicket(Ticket ticket);
	void updateTicketStatus(Ticket ticket, TicketStatus newStatus);
}

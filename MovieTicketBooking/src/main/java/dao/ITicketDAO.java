package dao;

import java.util.List;

import model.Ticket;

public interface ITicketDAO {
	List<Ticket> getTicketsByUserId(int userId);
	List<Ticket> getAllTickets();
}

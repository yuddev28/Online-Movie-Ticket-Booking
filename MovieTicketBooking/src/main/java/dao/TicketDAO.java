package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import model.PaymentMethod;
import model.ShowTime;
import model.ShowTimeSeat;
import model.Ticket;
import model.TicketStatus;
import model.User;

public class TicketDAO implements ITicketDAO {
	private IUserDAO userDAO;
	private IShowTimeDAO showTimeDAO;
	private IShowTimeSeatDAO showTimeSeatDAO;

	public TicketDAO() {
		userDAO = new UserDAO();
		showTimeDAO = new ShowTimeDAO();
		showTimeSeatDAO = new ShowTimeSeatDAO();
	}

	// get tickets by user id
	@Override
	public List<Ticket> getTicketsByUserId(int userId) {
		List<Ticket> list = new ArrayList<>();
		String sql = "SELECT * FROM tickets WHERE user_id = ?";
		try {
			Connection conn = JDBCConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Ticket ticket = mapResultSetToTicket(rs);
				list.add(ticket);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// get all tickets
	@Override
	public List<Ticket> getAllTickets() {
		List<Ticket> list = new ArrayList<>();
		String sql = "SELECT * FROM tickets WHERE user_id = ?";
		try {
			Connection conn = JDBCConnection.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Ticket ticket = mapResultSetToTicket(rs);
				list.add(ticket);
			}
			rs.close();
			st.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void addTicket(Ticket ticket) {
		String sql = "INSERT INTO tickets (ticket_uid, ticket_price, payment_method, ticket_status, user_id, showtime_id) "
				+ " VALUES (?, ?, ?, ?, ?, ?);";
	    try {
	    	Connection conn = JDBCConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, ticket.getUid());
	        ps.setBigDecimal(2, ticket.getTotalPrice());
	        ps.setString(3, ticket.getPaymentMethod().name());
	        ps.setString(4, ticket.getStatus().name());
	        ps.setInt(5, ticket.getUser().getId());
	        ps.setInt(6, ticket.getShowTime().getId());
	        ps.executeUpdate();
	        ps.close();
	        conn.close();
	        for(ShowTimeSeat sts : ticket.getSeats()) {
	        	showTimeSeatDAO.updateShowTimeSeat(sts.getId(), ticket.getUser());
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void updateTicketStatus(Ticket ticket, TicketStatus newStatus) {
		String sql = "UPDATE tickets SET ticket_status = ? WHERE ticket_id = ?;";
	    try {
	    	Connection conn = JDBCConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, newStatus.name());
	        ps.setInt(2, ticket.getId());
	        ps.executeUpdate();
	        ps.close();
	        conn.close();
	        // If user cancelled ticket => all show time seat in that ticket will be not booked
	        if(newStatus.equals(TicketStatus.CANCELLED)) {
	        	for(ShowTimeSeat sts : ticket.getSeats()) {
		        	showTimeSeatDAO.updateShowTimeSeat(sts.getId(), null);
		        }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	private Ticket mapResultSetToTicket(ResultSet rs) {
		Ticket ticket = new Ticket();
		try {
			ticket.setId(rs.getInt("ticket_id"));
			ticket.setUid(rs.getString("ticket_uid"));
			ticket.setTotalPrice(rs.getBigDecimal("ticket_price"));
			ticket.setPaymentMethod(PaymentMethod.valueOf(rs.getString("payment_method")));
			ticket.setStatus(TicketStatus.valueOf(rs.getString("ticket_status")));
			ticket.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
			ticket.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());

			int userId = rs.getInt("user_id");
			int showtimeId = rs.getInt("showtime_id");

			User user = userDAO.getUserById(userId);
			ticket.setUser(user);

			ShowTime showTime = showTimeDAO.getShowTimeById(showtimeId);
			ticket.setShowTime(showTime);
			
			List<ShowTimeSeat> showTimeSeats = showTimeSeatDAO.getShowTimeSeatsByShowTimeIdAndUserId(showtimeId, userId);
			ticket.setSeats(showTimeSeats);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ticket;
	}

}

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
import java.util.UUID;

import model.Cinema;
import model.Movie;
import model.PaymentMethod;
import model.Role;
import model.Room;
import model.ShowTime;
import model.ShowTimeSeat;
import model.Ticket;
import model.TicketStatus;
import model.User;

public class TicketDAO implements ITicketDAO {
	
	
	// get tickets by user id
	@Override
	public List<Ticket> getTicketsByUserId(int userId) {
		List<Ticket> list = new ArrayList<>();
		String sql = "SELECT ticket_id, ticket_uid, ticket_price, payment_method"
				+ ", ticket_status, created_at, updated_at, user_id, showtime_id FROM tickets WHERE user_id = ?";
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
		String sql = "SELECT t.ticket_id, t.ticket_uid, t.ticket_price, t.payment_method, t.ticket_status, t.created_at, t.updated_at,"
				+ "u.user_id, u.username, u.email, u.phonenumber, u.role,"
				+ "m.movie_id,  m.movie_name,"
				+ "c.cinema_id, c.cinema_name, c.cinema_address,"
				+ "r.room_id, r.room_name,"
				+ "s.showtime_id, s.start_time, s.showtime_price "
				+ "FROM tickets t "
				+ "JOIN users u "
				+ "ON t.user_id = u.user_id "
				+ "JOIN showtimes s "
				+ "ON t.showtime_id = s.showtime_id "
				+ "JOIN movies m "
				+ "ON s.movie_id = m.movie_id "
				+ "JOIN cinemas c "
				+ "ON s.cinema_id = c.cinema_id "
				+ "JOIN rooms r "
				+ "ON s.room_id = r.room_id "
				+ "ORDER BY t.created_at DESC;";
		try {
			Connection conn = JDBCConnection.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			Ticket ticket;
			User user;
			ShowTime showTime;
			Cinema cinema;
			Room room;
			Movie movie;
			List<ShowTimeSeat> seats; 
			int ticketId;
			IShowTimeSeatDAO seatDAO = new ShowTimeSeatDAO();
			while (rs.next()) {
				user = new User(rs.getInt("user_id"), rs.getString("username"), null, rs.getString("email"),
						rs.getString("phonenumber"), Role.valueOf(rs.getString("role")));
				
				cinema = new Cinema(rs.getInt("cinema_id"), rs.getString("cinema_name"), rs.getString("cinema_address"));
				
				room = new Room(rs.getInt("room_id"), rs.getString("room_name"));
				
				movie = new Movie(rs.getInt("movie_id"), rs.getString("movie_name"));
				
				showTime = new ShowTime(rs.getInt("showtime_id"), cinema, room, movie,
						rs.getBigDecimal("showtime_price"), rs.getTimestamp("start_time").toLocalDateTime(), null);
				
				ticketId = rs.getInt("ticket_id");
				seats = seatDAO.getShowTimeSeatsByShowTimeAndUserAndTicket(showTime.getId(), user.getId(), ticketId);
				
				ticket = new Ticket(ticketId, rs.getString("ticket_uid"), user, showTime, seats,
						rs.getBigDecimal("ticket_price"), PaymentMethod.valueOf(rs.getString("payment_method")),
						TicketStatus.valueOf(rs.getString("ticket_status")),
						rs.getTimestamp("created_at").toLocalDateTime(), rs.getTimestamp("created_at").toLocalDateTime());
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

	// Add new ticket
	@Override
	public boolean saveBooking(User user, int showtimeId, String[] seats, double totalPrice, String paymentMethod) {
		Connection conn = null;
		PreparedStatement psTicket = null;
		PreparedStatement psSeat = null;
		ResultSet rs = null;

		try {
			conn = JDBCConnection.getConnection();
			conn.setAutoCommit(false); // Bắt đầu Transaction

			// 1. Tạo mã vé (Ticket UID)
			String ticketUid = UUID.randomUUID().toString();

			double pricePerSeat = totalPrice / seats.length;

			// 2. Insert vào bảng TICKETS (Giữ nguyên)
			String sqlTicket = "INSERT INTO tickets (ticket_uid, ticket_price, payment_method, ticket_status, user_id, showtime_id) VALUES (?, ?, ?, 'PAID', ?, ?)";
			psTicket = conn.prepareStatement(sqlTicket, Statement.RETURN_GENERATED_KEYS);
			psTicket.setString(1, ticketUid);
			psTicket.setBigDecimal(2, java.math.BigDecimal.valueOf(pricePerSeat));
			psTicket.setString(3, paymentMethod);
			psTicket.setInt(4, user.getId());
			psTicket.setInt(5, showtimeId);
			psTicket.executeUpdate();

			int newTicketId = 0;
	        rs = psTicket.getGeneratedKeys();
	        if (rs.next()) {
	            newTicketId = rs.getInt(1);
	        } else {
	            throw new SQLException("Không lấy được ID vé vừa tạo.");
	        }
			// 3. Update bảng SHOWTIMESEATS (THAY ĐỔI Ở ĐÂY: Dùng UPDATE thay vì INSERT)
			// Tìm đúng ghế của suất chiếu đó và cập nhật user_id
			String sqlSeat = "UPDATE showtimeseats SET user_id = ?, ticket_id = ? WHERE showtime_id = ? AND seat_name = ?";
			psSeat = conn.prepareStatement(sqlSeat);

			for (String seat : seats) {
				// Cập nhật ghế (Tham số theo thứ tự dấu ? trong sqlSeat)
				psSeat.setInt(1, user.getId());
				psSeat.setInt(2, newTicketId);
				psSeat.setInt(3, showtimeId);
				psSeat.setString(4, seat.trim());
				psSeat.addBatch();
			}

			psTicket.executeBatch();
			int[] updateCounts = psSeat.executeBatch();

			// Kiểm tra xem có ghế nào update thất bại không
			for (int count : updateCounts) {
				if (count == 0) {
					// Nếu count == 0 tức là không tìm thấy ghế để update (Sai tên hoặc sai ID)
					System.out.println("LỖI: Không tìm thấy ghế trong DB để update. Kiểm tra lại tên ghế!");
					throw new SQLException("Lỗi: Ghế không tồn tại hoặc đã bị người khác đặt.");
				}
			}
			conn.commit(); // Xác nhận lưu
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (conn != null)
					conn.rollback(); // Gặp lỗi thì hoàn tác
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return false;
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public boolean updateTicketStatus(Ticket ticket, TicketStatus newStatus) {
		String sql = "UPDATE tickets SET ticket_status = ? WHERE ticket_id = ?;";
		try {
			Connection conn = JDBCConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newStatus.name());
			ps.setInt(2, ticket.getId());
			ps.executeUpdate();
			ps.close();
			conn.close();
			IShowTimeSeatDAO showTimeSeatDAO = new ShowTimeSeatDAO();
			// If user cancelled ticket => all show time seat in that ticket will be not
			// booked
			if (newStatus.equals(TicketStatus.CANCELLED)) {
				for (ShowTimeSeat sts : ticket.getSeats()) {
					showTimeSeatDAO.updateShowTimeSeat(sts.getId(), null);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	private Ticket mapResultSetToTicket(ResultSet rs) {
		Ticket ticket = new Ticket();
		try {
			int ticketId = rs.getInt("ticket_id");
			ticket.setId(ticketId);
			ticket.setUid(rs.getString("ticket_uid"));
			ticket.setTotalPrice(rs.getBigDecimal("ticket_price"));
			ticket.setPaymentMethod(PaymentMethod.valueOf(rs.getString("payment_method")));
			ticket.setStatus(TicketStatus.valueOf(rs.getString("ticket_status")));
			ticket.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
			ticket.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());

			int userId = rs.getInt("user_id");
			int showtimeId = rs.getInt("showtime_id");
			IUserDAO userDAO = new UserDAO();
			User user = userDAO.getUserById(userId);
			ticket.setUser(user);

			IShowTimeDAO showTimeDAO = new ShowTimeDAO();
			ShowTime showTime = showTimeDAO.getShowTimeById(showtimeId);
			ticket.setShowTime(showTime);

			IShowTimeSeatDAO showTimeSeatDAO = new ShowTimeSeatDAO();
			List<ShowTimeSeat> showTimeSeats = showTimeSeatDAO.getShowTimeSeatsByShowTimeAndUserAndTicket(showtimeId,
					userId, ticketId);
			ticket.setSeats(showTimeSeats);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ticket;
	}

}

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
// Thêm hàm này vào class TicketDAO
    
    // Hàm lưu vé (Transaction)
    public boolean saveBooking(User user, int showtimeId, String[] seats, double totalPrice, String paymentMethod) {
        Connection conn = null;
        PreparedStatement psTicket = null;
        PreparedStatement psSeat = null;
        
        try {
            conn = JDBCConnection.getConnection();
            conn.setAutoCommit(false); // Bắt đầu Transaction

            // 1. Tạo mã vé (Ticket UID)
            String ticketUid = "TCK-" + System.currentTimeMillis();

            // 2. Insert vào bảng TICKETS (Mỗi lần đặt là 1 Ticket cha chứa tổng tiền)
            // Lưu ý: Logic DB của bạn hơi lạ (1 vé - 1 user), ở đây mình sẽ tạo 1 record ticket đại diện cho giao dịch này
            // Hoặc tạo N record ticket cho N ghế. Theo DB của bạn: Ticket có User và ShowTime.
            // Để đơn giản và đúng logic DB bạn đưa: Mình sẽ tạo N vé cho N ghế.
            
            String sqlTicket = "INSERT INTO tickets (ticket_uid, ticket_price, payment_method, ticket_status, user_id, showtime_id) VALUES (?, ?, ?, 'PAID', ?, ?)";
            psTicket = conn.prepareStatement(sqlTicket);

            String sqlSeat = "INSERT INTO showtimeseats (seat_name, user_id, showtime_id, room_id) VALUES (?, ?, ?, ?)";
            psSeat = conn.prepareStatement(sqlSeat);

            // Lấy Room ID từ Showtime (Cần query phụ hoặc truyền vào)
            // Để nhanh, ta giả sử lấy được roomId từ servlet truyền xuống, hoặc query nhanh ở đây
            // (Ở đây tôi sẽ query nhanh roomId)
            int roomId = 0;
            PreparedStatement psRoom = conn.prepareStatement("SELECT room_id FROM showtimes WHERE showtime_id = ?");
            psRoom.setInt(1, showtimeId);
            ResultSet rsRoom = psRoom.executeQuery();
            if(rsRoom.next()) roomId = rsRoom.getInt("room_id");
            rsRoom.close();
            psRoom.close();

            double pricePerSeat = totalPrice / seats.length;

            for (String seat : seats) {
                // Tạo Ticket
                psTicket.setString(1, ticketUid + "-" + seat); // UID riêng cho từng vé
                psTicket.setBigDecimal(2, java.math.BigDecimal.valueOf(pricePerSeat));
                psTicket.setString(3, paymentMethod);
                psTicket.setInt(4, user.getId());
                psTicket.setInt(5, showtimeId);
                psTicket.addBatch();

                // Đánh dấu ghế đã ngồi
                psSeat.setString(1, seat);
                psSeat.setInt(2, user.getId());
                psSeat.setInt(3, showtimeId);
                psSeat.setInt(4, roomId);
                psSeat.addBatch();
            }

            psTicket.executeBatch();
            psSeat.executeBatch();

            conn.commit(); // Xác nhận lưu
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // Gặp lỗi thì hoàn tác
            } catch (SQLException ex) { ex.printStackTrace(); }
            return false;
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
    }
    
    // Hàm kiểm tra ghế đã đặt chưa (để vẽ màu xám trên sơ đồ)
    public List<String> getBookedSeats(int showtimeId) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT seat_name FROM showtimeseats WHERE showtime_id = ?";
        try {
            Connection conn = JDBCConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showtimeId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                list.add(rs.getString("seat_name"));
            }
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

}

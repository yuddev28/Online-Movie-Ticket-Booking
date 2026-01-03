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

    // --- CÁC HÀM MỚI ĐÃ ĐƯỢC CHỈNH SỬA ---

    // Hàm lưu vé (Transaction): SỬA logic từ INSERT sang UPDATE ghế
    public boolean saveBooking(User user, int showtimeId, String[] seats, double totalPrice, String paymentMethod) {
        Connection conn = null;
        PreparedStatement psTicket = null;
        PreparedStatement psSeat = null;
        
        try {
            conn = JDBCConnection.getConnection();
            conn.setAutoCommit(false); // Bắt đầu Transaction

            // 1. Tạo mã vé (Ticket UID)
            String ticketUid = "TCK-" + System.currentTimeMillis();

            // 2. Insert vào bảng TICKETS (Giữ nguyên)
            String sqlTicket = "INSERT INTO tickets (ticket_uid, ticket_price, payment_method, ticket_status, user_id, showtime_id) VALUES (?, ?, ?, 'PAID', ?, ?)";
            psTicket = conn.prepareStatement(sqlTicket);

            // 3. Update bảng SHOWTIMESEATS (THAY ĐỔI Ở ĐÂY: Dùng UPDATE thay vì INSERT)
            // Tìm đúng ghế của suất chiếu đó và cập nhật user_id
            String sqlSeat = "UPDATE showtimeseats SET user_id = ? WHERE showtime_id = ? AND seat_name = ?";
            psSeat = conn.prepareStatement(sqlSeat);

            double pricePerSeat = totalPrice / seats.length;

            for (String seat : seats) {
                // Tạo Ticket
                psTicket.setString(1, ticketUid + "-" + seat); 
                psTicket.setBigDecimal(2, java.math.BigDecimal.valueOf(pricePerSeat));
                psTicket.setString(3, paymentMethod);
                psTicket.setInt(4, user.getId());
                psTicket.setInt(5, showtimeId);
                psTicket.addBatch();

                // Cập nhật ghế (Tham số theo thứ tự dấu ? trong sqlSeat)
                psSeat.setInt(1, user.getId());   // user_id
                psSeat.setInt(2, showtimeId);     // showtime_id
                psSeat.setString(3, seat);        // seat_name
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
                if (conn != null) conn.rollback(); // Gặp lỗi thì hoàn tác
            } catch (SQLException ex) { ex.printStackTrace(); }
            return false;
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
    }
    
    // Hàm kiểm tra ghế đã đặt: SỬA logic chỉ lấy ghế có người (user_id khác NULL)
    public List<String> getBookedSeats(int showtimeId) {
        List<String> list = new ArrayList<>();
        // THAY ĐỔI Ở ĐÂY: Thêm điều kiện user_id IS NOT NULL
        String sql = "SELECT seat_name FROM showtimeseats WHERE showtime_id = ? AND user_id IS NOT NULL";
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
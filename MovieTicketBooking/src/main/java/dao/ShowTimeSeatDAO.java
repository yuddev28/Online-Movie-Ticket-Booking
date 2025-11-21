package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import model.Seat;
import model.ShowTime;
import model.ShowTimeSeat;
import model.User;

public class ShowTimeSeatDAO implements IShowTimeSeatDAO {
	private ISeatDAO seatDAO;
	private IUserDAO userDAO;
	private IShowTimeDAO showtimeDAO;

	public ShowTimeSeatDAO() {
		seatDAO = new SeatDAO();
		userDAO = new UserDAO();
		showtimeDAO = new ShowTimeDAO();
	}

	// Get list of show time seat by show time id
	@Override
	public List<ShowTimeSeat> getShowTimeSeatsByShowTimeId(int showTimeId) {
		List<ShowTimeSeat> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM showtimeseats WHERE showtime_id = ?;";
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, showTimeId);
			ResultSet rs = st.executeQuery();
			int id;
			Seat seat;
			User bookBy;
			ShowTime showTime = showtimeDAO.getShowTimeById(showTimeId);
			LocalDateTime createdAt;
			LocalDateTime updatedAt;
			ShowTimeSeat sts;
			while (rs.next()) {
				id = rs.getInt("showtimeseat_id");
				seat = seatDAO.getSeatById(rs.getInt("seat_id"));
				bookBy = userDAO.getUserById(rs.getInt("user_id"));
				createdAt = rs.getObject("created_at", LocalDateTime.class);
				updatedAt = rs.getObject("updated_at", LocalDateTime.class);
				sts = new ShowTimeSeat(id, seat, bookBy, showTime, createdAt, updatedAt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Get list of show time seats of user by user id
	@Override
	public List<ShowTimeSeat> getShowTimeSeatsByUserId(int userId) {
		List<ShowTimeSeat> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM showtimeseats WHERE user_id = ?;";
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, userId);
			ResultSet rs = st.executeQuery();
			int id;
			Seat seat;
			User bookBy = userDAO.getUserById(userId);
			;
			ShowTime showTime;
			LocalDateTime createdAt;
			LocalDateTime updatedAt;
			ShowTimeSeat sts;
			while (rs.next()) {
				id = rs.getInt("showtimeseat_id");
				seat = seatDAO.getSeatById(rs.getInt("seat_id"));
				showTime = showtimeDAO.getShowTimeById(rs.getInt("showtime_id"));
				createdAt = rs.getObject("created_at", LocalDateTime.class);
				updatedAt = rs.getObject("updated_at", LocalDateTime.class);
				sts = new ShowTimeSeat(id, seat, bookBy, showTime, createdAt, updatedAt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Add list of show time seats
	@Override
	public void addShowTimeSeats(List<ShowTimeSeat> list) {
		try {
			String sql = "INSERT INTO showtimeseats (user_id, showtime_id, seat_id) VALUES (?, ?, ?)";
			Connection conn = JBDCConnection.getConnection();
			PreparedStatement st = conn.prepareStatement(sql);

			// Tắt auto commit để batch hiệu quả
			conn.setAutoCommit(false);

			for (ShowTimeSeat sts : list) {

				// user_id có thể null
				if (sts.getBookedBy() != null) {
					st.setInt(1, sts.getBookedBy().getId());
				} else {
					st.setNull(1, java.sql.Types.INTEGER);
				}

				st.setInt(2, sts.getShowTimeId());
				st.setInt(3, sts.getSeatId());

				st.addBatch();
			}

			// Thực thi batch
			st.executeBatch();
			conn.commit();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Update user of show time seat by show time seat id, user can be null
	@Override
	public void updateShowTimeSeat(int showTimeSeatId, User user) {

		try {
			String sql = "UPDATE showtimeseats SET user_id = ? WHERE showtimeseat_id = ?;";

			Connection conn = JBDCConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			if (user != null) {
				ps.setInt(1, user.getId());
			} else {
				ps.setNull(1, java.sql.Types.INTEGER);
			}
			ps.setInt(2, showTimeSeatId);
			ps.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

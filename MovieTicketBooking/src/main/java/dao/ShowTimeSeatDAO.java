package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import model.Room;
import model.ShowTime;
import model.ShowTimeSeat;
import model.User;

public class ShowTimeSeatDAO implements IShowTimeSeatDAO {
	private IUserDAO userDAO;
	private IShowTimeDAO showtimeDAO;
	private IRoomDAO roomDAO;

	public ShowTimeSeatDAO() {
		userDAO = new UserDAO();
		showtimeDAO = new ShowTimeDAO();
		roomDAO = new RoomDAO();
	}

	// Get list of show time seat by show time id
	@Override
	public List<ShowTimeSeat> getShowTimeSeatsByShowTimeId(int showTimeId) {
		List<ShowTimeSeat> list = new ArrayList<>();
		try {
			String query = "SELECT showtimeseat_id, seat_name, created_at, updated_at, user_id, showtime_id, room_id FROM showtimeseats WHERE showtime_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, showTimeId);
			ResultSet rs = st.executeQuery();
			ShowTimeSeat sts;
			while (rs.next()) {
				sts = mapResultSetToShowTimeSeat(rs);
				list.add(sts);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Get list of show time seats of user by user id
	@Override
	public List<ShowTimeSeat> getShowTimeSeatsByUserId(int userId) {
		List<ShowTimeSeat> list = new ArrayList<>();
		try {
			String query = "SELECT showtimeseat_id, seat_name, created_at, updated_at, user_id, showtime_id, room_id FROM showtimeseats WHERE user_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, userId);
			ResultSet rs = st.executeQuery();
			ShowTimeSeat sts;
			while (rs.next()) {
				sts = mapResultSetToShowTimeSeat(rs);
				list.add(sts);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<ShowTimeSeat> getShowTimeSeatsByShowTimeIdAndUserId(int showTimeId, int userId) {
		List<ShowTimeSeat> list = new ArrayList<>();
		try {
			String query = "SELECT showtimeseat_id, seat_name, created_at, updated_at, user_id, showtime_id, room_id FROM showtimeseats WHERE showtime_id = ? AND user_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, showTimeId);
			st.setInt(2, userId);
			ResultSet rs = st.executeQuery();
			ShowTimeSeat sts;
			while (rs.next()) {
				sts = mapResultSetToShowTimeSeat(rs);
				list.add(sts);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Add list of show time seats
	@Override
	public void addShowTimeSeats(List<ShowTimeSeat> list) {
		try {
			String sql = "INSERT INTO showtimeseats ( seat_name, user_id, showtime_id, room_id) VALUES (?, ?, ?, ?)";
			Connection conn = JDBCConnection.getConnection();
			PreparedStatement st = conn.prepareStatement(sql);

			// Tắt auto commit để batch hiệu quả
			conn.setAutoCommit(false);

			for (ShowTimeSeat sts : list) {
				st.setString(1, sts.getSeatName());
				// user_id có thể null
				if (sts.getBookedBy() != null) {
					st.setInt(2, sts.getBookedBy().getId());
				} else {
					st.setNull(2, java.sql.Types.INTEGER);
				}

				st.setInt(3, sts.getShowTimeId());
				st.setInt(4, sts.getRoom().getId());
				st.addBatch();
			}

			// Thực thi batch
			st.executeBatch();
			conn.commit();
			st.close();
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

			Connection conn = JDBCConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			if (user != null) {
				ps.setInt(1, user.getId());
			} else {
				ps.setNull(1, java.sql.Types.INTEGER);
			}
			ps.setInt(2, showTimeSeatId);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// map result set to show time seat
	private ShowTimeSeat mapResultSetToShowTimeSeat(ResultSet rs) {
		ShowTimeSeat sts = null;
		try {
			int id = rs.getInt("showtimeseat_id");
			String seatName = rs.getString("seat_name");
			int userId = rs.getInt("user_id");
			User bookBy = userDAO.getUserById(userId);
			ShowTime showTime = showtimeDAO.getShowTimeById(rs.getInt("showtime_id"));
			Room room = roomDAO.getRoomById(rs.getInt("room_id"));
			LocalDateTime createdAt = rs.getTimestamp("created_at").toLocalDateTime();
			LocalDateTime updatedAt = rs.getTimestamp("updated_at").toLocalDateTime();
			sts = new ShowTimeSeat(id, seatName, room, bookBy, showTime, createdAt, updatedAt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sts;
	}

}

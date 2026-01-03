package dao;

import java.sql.Statement;
import java.sql.Timestamp;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import model.Cinema;
import model.Movie;
import model.Room;
import model.ShowTime;
import model.ShowTimeSeat;

public class ShowTimeDAO implements IShowTimeDAO {
	private ICinemaDAO cinemaDAO;
	private IRoomDAO roomDAO;
	private IMovieDAO movieDAO;

	public ShowTimeDAO() {
		cinemaDAO = new CinemaDAO();
		roomDAO = new RoomDAO();
		movieDAO = new MovieDAO();
	}

	// Get all show time
	@Override
	public List<ShowTime> getAllShowTime() {
		List<ShowTime> list = new ArrayList<>();
		try {
			// SỬA LỖI: Bỏ dấu ngoặc đơn () bao quanh danh sách cột
			String query = "SELECT showtime_id, showtime_price, start_time, movie_id, cinema_id, room_id FROM showtimes;";
			Connection connect = JDBCConnection.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				list.add(mapResultSetToShowTime(rs));
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Get show time by id (HÀM QUAN TRỌNG CHO TRANG CHỌN GHẾ)
	@Override
	public ShowTime getShowTimeById(int id) {
		ShowTime showTime = null;
		try {
			// SỬA LỖI: Bỏ dấu ngoặc đơn ()
			String query = "SELECT showtime_id, showtime_price, start_time, movie_id, cinema_id, room_id FROM showtimes WHERE showtime_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			// Dùng if thay vì while vì ID là duy nhất
			if (rs.next()) {
				showTime = mapResultSetToShowTime(rs);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return showTime;
	}

	// Get list of show time by cinema id and movie id and day
	@Override
	public List<ShowTime> getShowTimeByCinemaAndMovieAndStartDay(int cinemaId, int movieId, LocalDateTime day) {
		List<ShowTime> list = new ArrayList<>();
		try {
			// SỬA LỖI: Bỏ dấu ngoặc đơn ()
			String query = "SELECT showtime_id, showtime_price, start_time, movie_id, cinema_id, room_id FROM showtimes "
					+ "WHERE cinema_id = ? AND movie_id = ? AND start_time >= ? AND start_time < ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, cinemaId);
			st.setInt(2, movieId);
			st.setTimestamp(3, Timestamp.valueOf(day.toLocalDate().atStartOfDay()));
			st.setTimestamp(4, Timestamp.valueOf(day.toLocalDate().plusDays(1).atStartOfDay()));
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				list.add(mapResultSetToShowTime(rs));
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Add show time
	@Override
	public void addShowTime(ShowTime showTime) {
		try {
			String query = "INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES (?, ?, ?, ?, ?);";
			Connection connect = JDBCConnection.getConnection();
			// Cần lấy ID tự sinh của ShowTime vừa tạo để gán cho ghế
			PreparedStatement st = connect.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			st.setBigDecimal(1, showTime.getPricePerTicket());
			st.setTimestamp(2, Timestamp.valueOf(showTime.getStartTime()));
			st.setInt(3, showTime.getMovieId());
			st.setInt(4, showTime.getCinemaId());
			st.setInt(5, showTime.getRoomId());

			st.executeUpdate();
			// Lấy ID suất chiếu vừa tạo
			ResultSet rs = st.getGeneratedKeys();
			int showTimeId = 0;
			if (rs.next()) {
				showTimeId = rs.getInt(1);
				showTime.setId(showTimeId); // Cập nhật ID vào object
			}
			st.close();
			connect.close();

			// 2. Tự động sinh ghế trống cho suất chiếu này (Logic mới)
			// Lấy thông tin phòng để biết số dòng/cột
			Room room = roomDAO.getRoomById(showTime.getRoomId());
			showTime.setRoom(room); // Set room đầy đủ thông tin vào showTime

			// Tạo list ghế (A1, A2... trong Memory)
			List<ShowTimeSeat> seats = showTime.createListShowTimeSeats();
			
			// Lưu list ghế vào DB (tất cả user_id đều null)
			IShowTimeSeatDAO stsDAO = new ShowTimeSeatDAO();
			stsDAO.addShowTimeSeats(seats);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete show time
	@Override
	public void deleteShowTimeById(int id) {
		try {
			String query = "DELETE FROM showtimes WHERE showtime_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Map ResultSet sang Object
	private ShowTime mapResultSetToShowTime(ResultSet rs) {
		ShowTime showTime = null;
		try {
			int id = rs.getInt("showtime_id");
			BigDecimal price = rs.getBigDecimal("showtime_price");
			LocalDateTime startTime = rs.getTimestamp("start_time").toLocalDateTime();

			// Lấy thông tin các bảng liên quan
			// Đảm bảo movieDAO, cinemaDAO, roomDAO hoạt động tốt
			Movie movie = movieDAO.getMovieById(rs.getInt("movie_id"));
			Cinema cinema = cinemaDAO.getCinemaById(rs.getInt("cinema_id"));
			Room room = roomDAO.getRoomById(rs.getInt("room_id"));

			showTime = new ShowTime(id, cinema, room, movie, price, startTime);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return showTime;
	}

	// Lấy lịch chiếu 7 ngày (Hàm này bạn đã thêm đúng, giữ nguyên logic nhưng bỏ
	// dấu ngoặc nếu có)
	public List<ShowTime> getShowTimesByMovieId(int movieId) {
		List<ShowTime> list = new ArrayList<>();
		// Query chuẩn không có ngoặc đơn
		String query = "SELECT showtime_id, showtime_price, start_time, movie_id, cinema_id, room_id "
				+ "FROM showtimes " + "WHERE movie_id = ? " + "AND start_time >= NOW() "
				+ "AND start_time <= DATE_ADD(NOW(), INTERVAL 7 DAY) " + "ORDER BY start_time ASC";
		try {
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, movieId);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				list.add(mapResultSetToShowTime(rs));
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
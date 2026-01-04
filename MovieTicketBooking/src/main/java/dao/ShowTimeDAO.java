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
			String query = "SELECT showtime_id, showtime_price, start_time, created_at, movie_id, cinema_id, room_id FROM showtimes;";
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

	// Get show time by id
	@Override
	public ShowTime getShowTimeById(int id) {
		ShowTime showTime = null;
		try {
			String query = "SELECT showtime_id, showtime_price, start_time, created_at, movie_id, cinema_id, room_id FROM showtimes WHERE showtime_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
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

	// Get list of show time by cinema id and movie id and day have show time
	@Override
	public List<ShowTime> getShowTimeByCinemaAndMovieAndStartDay(int cinemaId, int movieId, LocalDateTime day) {
		List<ShowTime> list = new ArrayList<>();
		try {
			String query = "SELECT showtime_id, showtime_price, start_time, created_at, movie_id, cinema_id, room_id FROM showtimes "
					+ "WHERE cinema_id = ? AND movie_id = ? AND start_time >= ? AND start_time < ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, cinemaId);
			st.setInt(2, movieId);
			st.setTimestamp(3, Timestamp.valueOf(day.toLocalDate().atStartOfDay()));
			st.setTimestamp(4, Timestamp.valueOf(day.toLocalDate().plusDays(1).atStartOfDay()));
			ResultSet rs = st.executeQuery();
			ShowTime showTime;
			while (rs.next()) {
				showTime = mapResultSetToShowTime(rs);
				list.add(showTime);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Add show time and seats of it
	@Override
	public boolean addShowTime(ShowTime showTime) {
		String query = "INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES "
				+ "(?, ?, ?, ?, ?);";
		try {
			Connection connect = JDBCConnection.getConnection();
			connect.setAutoCommit(false);
			PreparedStatement st = connect.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
			st.setBigDecimal(1, showTime.getPricePerTicket());
			st.setTimestamp(2, Timestamp.valueOf(showTime.getStartTime()));
			st.setInt(3, showTime.getMovieId());
			st.setInt(4, showTime.getCinemaId());
			st.setInt(5, showTime.getRoomId());
			st.executeUpdate();
			ResultSet rs = st.getGeneratedKeys();
			if (!rs.next()) {
				return false;
			}

			int newShowTimeId = rs.getInt(1);
			rs.close();
			
			st.close();
			connect.commit();
			connect.close();
			// Create seats and add to db
			ShowTime newShowTime = new ShowTime(newShowTimeId, showTime.getCinema(), showTime.getRoom(), showTime.getMovie(), showTime.getPricePerTicket(), showTime.getStartTime(), LocalDateTime.now());
			List<ShowTimeSeat> seats = newShowTime.createListShowTimeSeats();
			IShowTimeSeatDAO stsDAO = new ShowTimeSeatDAO();
			stsDAO.addShowTimeSeats(seats);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// Delete show time by showtime id
	@Override
	public boolean deleteShowTimeById(int id) {
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
			return false;
		}
		return true;
	}
	
	public List<ShowTime> getShowTimesByMovieId(int movieId) {
		List<ShowTime> list = new ArrayList<>();
		// Query chuẩn không có ngoặc đơn
		String query = "SELECT showtime_id, showtime_price, start_time, created_at, movie_id, cinema_id, room_id "
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

	private ShowTime mapResultSetToShowTime(ResultSet rs) {
		ShowTime showTime = null;
		try {
			int id = rs.getInt("showtime_id");
			BigDecimal price = rs.getBigDecimal("showtime_price");
			LocalDateTime startTime = rs.getTimestamp("start_time").toLocalDateTime();
			LocalDateTime createdAt = rs.getTimestamp("created_at").toLocalDateTime();
			Movie movie = movieDAO.getMovieById(rs.getInt("movie_id"));
			Cinema cinema = cinemaDAO.getCinemaById(rs.getInt("cinema_id"));
			Room room = roomDAO.getRoomById(rs.getInt("room_id"));
			showTime = new ShowTime(id, cinema, room, movie, price, startTime, createdAt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return showTime;
	}

}

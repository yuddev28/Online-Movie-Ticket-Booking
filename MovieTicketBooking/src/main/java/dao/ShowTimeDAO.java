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

public class ShowTimeDAO implements IShowTimeDAO{
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
			String query = "SELECT * FROM showtimes;";
			Connection connect = JBDCConnection.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery(query);
			int id;
			BigDecimal price;
			Cinema cinema;
			Room room;
			Movie movie;
			LocalDateTime startTime;
			ShowTime showTime;
			while(rs.next()) {
				id = rs.getInt("showtime_id");
				price = rs.getBigDecimal("showtime_price");
				startTime = rs.getObject("start_time", LocalDateTime.class);
				movie = movieDAO.getMovieById(rs.getInt("movie_id"));
				cinema = cinemaDAO.getCinemaById(rs.getInt("cinema_id"));
				room = roomDAO.getRoomById(rs.getInt("room_id"));
				showTime = new ShowTime(id, cinema, room, movie, price, startTime);
				list.add(showTime);
			}
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
			String query = "SELECT * FROM showtimes WHERE showtime_id = ?;";
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			BigDecimal price;
			Cinema cinema;
			Room room;
			Movie movie;
			LocalDateTime startTime;
			while(rs.next()) {
				price = rs.getBigDecimal("showtime_price");
				startTime = rs.getObject("start_time", LocalDateTime.class);
				movie = movieDAO.getMovieById(rs.getInt("movie_id"));
				cinema = cinemaDAO.getCinemaById(rs.getInt("cinema_id"));
				room = roomDAO.getRoomById(rs.getInt("room_id"));
				showTime = new ShowTime(id, cinema, room, movie, price, startTime);
			}
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
			String query = "SELECT * FROM showtimes WHERE cinema_id = ? AND movie_id = ? AND start_time >= ? AND start_time < ?;";
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, cinemaId);
			st.setInt(2, movieId);
			st.setTimestamp(3, Timestamp.valueOf(day.toLocalDate().atStartOfDay()));
			st.setTimestamp(4, Timestamp.valueOf(day.toLocalDate().plusDays(1).atStartOfDay()));
			ResultSet rs = st.executeQuery();
			int id;
			BigDecimal price;
			Cinema cinema;
			Room room;
			Movie movie;
			LocalDateTime startTime;
			ShowTime showTime;
			while(rs.next()) {
				id = rs.getInt("showtime_id");
				price = rs.getBigDecimal("showtime_price");
				startTime = rs.getObject("start_time", LocalDateTime.class);
				movie = movieDAO.getMovieById(rs.getInt("movie_id"));
				cinema = cinemaDAO.getCinemaById(rs.getInt("cinema_id"));
				room = roomDAO.getRoomById(rs.getInt("room_id"));
				showTime = new ShowTime(id, cinema, room, movie, price, startTime);
				list.add(showTime);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// Add show time
	@Override
	public void addShowTime(ShowTime showTime) {
		try {
			String query = "INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES "
					+ "(?, ?, ?, ?, ?);";
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setBigDecimal(1, showTime.getPricePerTicket());
			st.setTimestamp(2, Timestamp.valueOf(showTime.getStartTime()));
			st.setInt(3, showTime.getMovieId());
			st.setInt(4, showTime.getCinemaId());
			st.setInt(5, showTime.getRoomId());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// Delete show time by showtime id
	@Override
	public void deleteShowTimeById(int id) {
		try {
			String query = "DELETE FROM showtimes WHERE showtime_id = ?;";
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

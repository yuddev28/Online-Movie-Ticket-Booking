package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Cinema;
import model.Room;

public class CinemaDAO implements ICinemaDAO{
	// Get all cinema
	@Override
	public List<Cinema> getAllCinema() {
		List<Cinema> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM cinemas;";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery(query);
			int id;
			String name;
			String address;
			Cinema cinema;
			while (rs.next()) {
				id = rs.getInt("cinema_id");
				name = rs.getString("cinema_name");
				address = rs.getString("cinema_address");
				cinema = new Cinema(id, name, address);
				list.add(cinema);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Get cinema by id
	@Override
	public Cinema getCinemaById(int id) {
		Cinema cinema = null;
		try {
			String query = "SELECT * FROM cinemas WHERE cinema_id = ?;";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery(query);
			String name;
			String address;
			while (rs.next()) {
				id = rs.getInt("cinema_id");
				name = rs.getString("cinema_name");
				address = rs.getString("cinema_address");
				cinema = new Cinema(id, name, address);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cinema;
	}
	
	// Add cinema
	@Override
	public void addCinema(Cinema cinema) {
		try {
			String query = "INSERT INTO cinemas (cinema_name, cinema_address) VALUES (?, ?);";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setString(1, cinema.getName());
			st.setString(2, cinema.getAddress());
			st.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete cinema by id
	@Override
	public int deleteCinemaById(int id) {
		int update = 0;
		try {
			String query = "DELETE FROM cinemas WHERE cinema_id = ?;";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			update = st.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update;
	}
}

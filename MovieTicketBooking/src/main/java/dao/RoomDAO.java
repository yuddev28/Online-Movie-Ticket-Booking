package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Movie;
import model.MovieStatus;
import model.Room;

public class RoomDAO {
	// Get list of all rooms
	public List<Room> getAllRoom(){
		List<Room> list = new ArrayList<>();
		try {
			// Query string to get data
			String queryString = "SELECT * FROM rooms";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery(queryString);
			// Iterate result set to get data
			int id;
			String name;
			Room room;
			while (rs.next()) {
				id = rs.getInt("movie_id");
				name = rs.getString("movie_name");
				room = new Room(id, name);
				list.add(room);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Add room with cinema id
	public void addRoom(Room room, int cinemaId) {
		try {
			String query = "INSERT INTO rooms (room_name, cinema_id) VALUES (?, ?);";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setString(1, room.getName());
			st.setInt(2, cinemaId);
			st.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// Delete room by id
	public int deleteRoomById(int id) {
		int update = 0;
		try {
			// Query string to get data
			String queryString = "DELETE FROM rooms WHERE room_id = ?";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(queryString);
			st.setInt(1, id);
			update = st.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update;
	}
}

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
import model.Seat;

public class RoomDAO implements IRoomDAO{
	private ISeatDAO seatDAO = new SeatDAO();
	
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
			Seat[] seats;
			while (rs.next()) {
				id = rs.getInt("movie_id");
				name = rs.getString("movie_name");
				// Get seats of this room
				seats = (Seat[]) seatDAO.getSeatsByRoomId(id).toArray();
				room = new Room(id, name, seats);
				list.add(room);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Get room by room id
	public Room getRoomById(int roomId) {
		Room room = null;
		try {
			String query = "SELECT * FROM rooms WHERE room_id = ?";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, roomId);
			ResultSet rs = st.executeQuery();
			int id;
			String name;
			// Get seats of this room
			Seat[] seats = (Seat[]) seatDAO.getSeatsByRoomId(roomId).toArray();
			while(rs.next()) {
				id = rs.getInt("movie_id");
				name = rs.getString("movie_name");
				room = new Room(id, name, seats); 
			}
			st.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return room;
	}
	
	// Get list of rooms by cinema id
	public List<Room> getRoomByCinemaId(int id){
		List<Room> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM rooms WHERE cinema_id = ?;";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			int roomId;
			String roomName;
			Room room;
			Seat[] seats;
			while (rs.next()) {
				roomId = rs.getInt("room_id");
				roomName = rs.getString("room_name");
				seats = (Seat[]) seatDAO.getSeatsByRoomId(roomId).toArray();
				room = new Room(roomId, roomName, seats);
				list.add(room);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Add room with cinema id, then add seats of room
	public void addRoom(Room room, int cinemaId) {
		try {
			String query = "INSERT INTO rooms (room_name, cinema_id) VALUES (?, ?);";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setString(1, room.getName());
			st.setInt(2, cinemaId);
			st.executeUpdate();
			// Add seats of this room to db
			Seat[] seats = room.getSeats();
			seatDAO.addSeats(seats);
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

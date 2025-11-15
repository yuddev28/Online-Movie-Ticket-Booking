package dao;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Seat;
import model.Room;

public class SeatDAO {
	// Get seats by room id
	public List<Seat> getSeatsByRoomId(int roomId){
		RoomDAO roomDAO = new RoomDAO();
		List<Seat> seats = new ArrayList<>();
		try {
			// Query string to get data
			String queryString = "SELECT * FROM seats WHERE room_id = ?;";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(queryString);
			st.setInt(1, roomId);
			ResultSet rs = st.executeQuery(queryString);
			// Iterate result set to get data
			int id;
			String name;
			Room room = roomDAO.getRoomById(roomId);
			Seat seat;
			while(rs.next()) {
				id = rs.getInt("seat_id");
				name = rs.getString("seat_name");
				seat = new Seat(id, name, room);
				seats.add(seat);
			}
			
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seats;
	}
	
	// Add a list of seats (array)
	public void addSeats(Seat[] seats) {
		try {
			String query = "INSERT INTO seats (seat_name, room_id) VALUES (?, ?);";
			// Create connect
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			for(Seat seat : seats) {
				st.setString(1, seat.getName());
				st.setInt(2, seat.getRoomId());
				st.addBatch();
			}
			st.executeBatch();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}

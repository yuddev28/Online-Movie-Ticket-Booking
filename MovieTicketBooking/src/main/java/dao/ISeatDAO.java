package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Room;
import model.Seat;

public interface ISeatDAO {
	// Get seats by room id
	List<Seat> getSeatsByRoomId(int roomId);

	// Add a list of seats (array)
	void addSeats(Seat[] seats);

}

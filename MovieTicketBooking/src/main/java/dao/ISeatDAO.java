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
	List<Seat> getSeatsByRoomId(int roomId);
	Seat getSeatById(int id);
	void addSeats(Seat[] seats);

}

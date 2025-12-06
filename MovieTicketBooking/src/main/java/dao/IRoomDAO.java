package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Room;
import model.Seat;

public interface IRoomDAO {
	// Get list of all rooms
	List<Room> getAllRoom();

	// Get room by room id
	Room getRoomById(int roomId);

	// Get list of rooms by cinema id
	List<Room> getRoomByCinemaId(int id);

	// Add room with cinema id, then add seats of room
	void addRoom(Room room, int cinemaId);

	// Delete room by id
	int deleteRoomById(int id);
}

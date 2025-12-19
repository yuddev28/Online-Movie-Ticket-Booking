package dao;

import java.util.ArrayList;
import java.util.List;

import model.Room;

public interface IRoomDAO {
	// Get room by room id
	Room getRoomById(int roomId);

	// Get list of rooms by cinema id
	List<Room> getRoomByCinemaId(int id);

	// Add room with cinema id, then add seats of room
	boolean addRoom(Room room, int cinemaId);
	
	// Update room with id
	int updateRoom(int id, Room room);

	// Delete room by id
	int deleteRoomById(int id);
}

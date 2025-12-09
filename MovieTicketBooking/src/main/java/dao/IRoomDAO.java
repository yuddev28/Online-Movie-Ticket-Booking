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
	void addRoom(Room room, int cinemaId);

	// Delete room by id
	int deleteRoomById(int id);
}

package model;

public class Seat {
	private int id;
	private String name;
	private Room room;

	public Seat() {}
	
	public Seat(String name, Room room) {
		this.name = name;
		this.room = room;
	}
	
	public Seat(int id, String name, Room room) {
		this.id = id;
		this.name = name;
		this.room = room;
	}
	
	// Get room id;
	public int getRoomId() {
		return room.getId();
	}

	// Getter and Setter
	public Room getRoom() {
		return room;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

}
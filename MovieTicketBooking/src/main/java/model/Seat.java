package model.bean;

public class Seat {
	private int id;
	private String name;
	private Room room;

	public Seat() {}
	
	public Seat(int id, String name, Room room) {
		this.id = id;
		this.name = name;
		this.room = room;
	}

	// Getter and Setter
	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

}
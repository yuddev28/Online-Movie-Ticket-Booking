package model.bean;

import java.util.ArrayList;
import java.util.List;

public class Cinema {
	private int id;
	private String name;
	private String address;
	private List<Room> rooms;
	
	public Cinema() {}
	
	public Cinema(int id, String name, String address) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.rooms = new ArrayList<>();
	}

	//Getter and Setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	public int getId() {
		return id;
	}

	
	
}

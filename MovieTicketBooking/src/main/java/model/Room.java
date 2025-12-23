package model;

import java.time.LocalDateTime;

public class Room {
	private int id;
	private String name;
	private int numberOfColumns;
	private int numberOfRows;
	private Cinema cinema;

	public Room() {
	}

	public Room(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public Room(String name, int numberOfColumns, int numberOfRows, Cinema cinema) {
		this.name = name;
		this.numberOfColumns = numberOfColumns;
		this.numberOfRows = numberOfRows;
		this.cinema = cinema;
	}
	
	public Room(int id, String name, int numberOfColumns, int numberOfRows, Cinema cinema) {
		this.id = id;
		this.name = name;
		this.numberOfColumns = numberOfColumns;
		this.numberOfRows = numberOfRows;
		this.cinema = cinema;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public int getNumberOfColumns() {
		return numberOfColumns;
	}

	public void setNumberOfColumns(int numberOfColumns) {
		this.numberOfColumns = numberOfColumns;
	}

	public int getNumberOfRows() {
		return numberOfRows;
	}

	public void setNumberOfRows(int numberOfRows) {
		this.numberOfRows = numberOfRows;
	}

	public Cinema getCinema() {
		return cinema;
	}
	
	
}

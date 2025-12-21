package model;

import java.time.LocalDateTime;

public class Room {
	private int id;
	private String name;
	private int numberOfColumns;
	private int numberOfRows;

	public Room() {
	}

	public Room(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public Room(int id, String name, int numberOfColumns, int numberOfRows) {
		this.id = id;
		this.name = name;
		this.numberOfColumns = numberOfColumns;
		this.numberOfRows = numberOfRows;
	}

//	/*
//	 * Generate seat with number of rows and number of columns startId is start id
//	 * of seat number of rows must be in 1 and 26 because alphabet just have 26
//	 * letter seat name is a combination of letter and number
//	 */
//	private Seat[] generateSeat(int numberOfRows, int numberOfColumns) {
//		if (numberOfRows < 1 && numberOfRows > 26)
//			throw new IllegalArgumentException("Number of row must be in 1 and 26 ");
//		Seat[] seats = new Seat[numberOfRows * numberOfColumns];
//		int count = 0;
//		char seatLetter = 'A';
//		int seatNumber = 1;
//		while (count < seats.length) {
//			seats[count] = new Seat("" + seatLetter + seatNumber, this);
//			seatNumber++;
//			count++;
//			if (count >= numberOfColumns && count % numberOfColumns == 0) {
//				seatNumber = 1;
//				seatLetter++;
//			}
//
//		}
//		return seats;
//	}

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
	
	
}

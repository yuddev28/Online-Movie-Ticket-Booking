package model;

import java.time.LocalDateTime;

public class Room {
	private int id;
	private String name;
	private Seat[] seats;

	public Room() {
	}

	public Room(int id, String name, Seat[] seats) {
		this.id = id;
		this.name = name;
		this.seats = seats;
	}
	
	public Room(int id, String name, int numberOfRows, int numberOfColumns) {
		this.id = id;
		this.name = name;
		this.seats = generateSeat(numberOfRows, numberOfColumns);
	}

	/*
	 * Generate seat with number of rows and number of columns startId is start id
	 * of seat number of rows must be in 1 and 26 because alphabet just have 26
	 * letter seat name is a combination of letter and number
	 */
	private Seat[] generateSeat(int numberOfRows, int numberOfColumns) {
		if (numberOfRows < 1 && numberOfRows > 26)
			throw new IllegalArgumentException("Number of row must be in 1 and 26 ");
		Seat[] seats = new Seat[numberOfRows * numberOfColumns];
		int count = 0;
		char seatLetter = 'A';
		int seatNumber = 1;
		while (count < seats.length) {
			seats[count] = new Seat("" + seatLetter + seatNumber, this);
			seatNumber++;
			count++;
			if (count >= numberOfColumns && count % numberOfColumns == 0) {
				seatNumber = 1;
				seatLetter++;
			}

		}
		return seats;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Seat[] getSeats() {
		return seats;
	}

	public void setSeats(Seat[] seats) {
		this.seats = seats;
	}

	public int getId() {
		return id;
	}

}

package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ShowTime {
	private int id;
	private Cinema cinema;
	private Room room;
	private Movie movie;
	private BigDecimal pricePerTicket;
	private LocalDateTime startTime;
	private LocalDateTime createdAt;
	
	public ShowTime() {}
	
	public ShowTime(int id, Cinema cinema, Room room, Movie movie, BigDecimal pricePerTicket,
			LocalDateTime startTime) {
		this.id = id;
		this.cinema = cinema;
		this.room = room;
		this.movie = movie;
		this.pricePerTicket = pricePerTicket;
		this.startTime = startTime;
		this.createdAt = LocalDateTime.now();
	}
	
	//Create show time seat have name EX: A1 - Z10000
	public List<ShowTimeSeat> createListShowTimeSeats(){
		int rows = room.getNumberOfRows();
		int columns = room.getNumberOfColumns();
		if (rows < 1 && rows > 26)
			throw new IllegalArgumentException("Number of row must be in 1 and 26 ");
		List<ShowTimeSeat> seats = new ArrayList<>();
		int length = rows * columns;
		int count = 0;
		char seatLetter = 'A';
		int seatNumber = 1;
		while (count < length) {
			seats.add(new ShowTimeSeat("" + seatLetter + seatNumber, room, this));
			seatNumber++;
			count++;
			if (count >= columns && count % columns == 0) {
				seatNumber = 1;
				seatLetter++;
			}

		}
		return seats;
	}
	
	public int getCinemaId() {
		return cinema.getId();
	}
	
	public int getRoomId() {
		return room.getId();
	}
	
	public int getMovieId() {
		return movie.getId();
	}

	// Get cinema name and address
	public String getCinemaInfo() {
		return cinema.getAllInfo();
	}
	
	// Get room name
	public String getRoomName() {
		return room.getName();
	}
	
	// Get movie name
	public String getMovieName() {
		return movie.getName();
	}
	
	// Getter and Setter
	public Room getRoom() {
		return room;
	}

	public Cinema getCinema() {
		return cinema;
	}

	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public BigDecimal getPricePerTicket() {
		return pricePerTicket;
	}

	public void setPricePerTicket(BigDecimal pricePerTicket) {
		this.pricePerTicket = pricePerTicket;
	}

	public LocalDateTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalDateTime startTime) {
		this.startTime = startTime;
	}

	public int getId() {
		return id;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	
}

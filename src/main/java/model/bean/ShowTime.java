package model.bean;

import java.math.BigDecimal;
import java.time.LocalDateTime;

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

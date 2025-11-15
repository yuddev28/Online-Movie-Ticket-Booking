package model;

import java.time.LocalDateTime;

public class ShowtimeSeat {
	private int id;
	private Seat seat;
	private User bookedBy;
	private ShowTime showTime;
	private boolean haveBooked;
	private LocalDateTime updatedAt;
	
	public ShowtimeSeat() {}
	
	//Constructor with user 
	public ShowtimeSeat(int id, Seat seat, User bookedBy, ShowTime showTime) {
		this.id = id;
		this.seat = seat;
		this.bookedBy = bookedBy;
		this.showTime = showTime;
		this.haveBooked = true;
		this.updatedAt = LocalDateTime.now();
	}

	//Constructor without user
	public ShowtimeSeat(int id, Seat seat, ShowTime showTime) {
		this.id = id;
		this.seat = seat;
		this.showTime = showTime;
		this.haveBooked = false;
		this.updatedAt = LocalDateTime.now();
	}

	//Getter and Setter
	public Seat getSeat() {
		return seat;
	}

	public void setSeat(Seat seat) {
		this.seat = seat;
	}

	public User getBookedBy() {
		return bookedBy;
	}

	public void setBookedBy(User bookedBy) {
		this.bookedBy = bookedBy;
	}

	public ShowTime getShowTime() {
		return showTime;
	}

	public void setShowTime(ShowTime showTime) {
		this.showTime = showTime;
	}

	public boolean isHaveBooked() {
		return haveBooked;
	}

	public void setHaveBooked(boolean haveBooked) {
		this.haveBooked = haveBooked;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getId() {
		return id;
	}
	
}

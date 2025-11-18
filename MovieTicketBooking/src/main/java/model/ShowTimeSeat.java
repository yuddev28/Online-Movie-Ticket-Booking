package model;

import java.time.LocalDateTime;

public class ShowTimeSeat {
	private int id;
	private Seat seat;
	private User bookedBy;
	private ShowTime showTime;
	private boolean haveBooked;
	private LocalDateTime updatedAt;
	
	public ShowTimeSeat() {}
	
	// contructor use for get data from db
	public ShowTimeSeat(int id, Seat seat, User bookedBy, ShowTime showTime) {
		this.id = id;
		this.seat = seat;
		this.bookedBy = bookedBy;
		this.showTime = showTime;
		haveBooked = (bookedBy == null);
		this.updatedAt = LocalDateTime.now();
	}

	// constructor use for create show time seat
	public ShowTimeSeat(Seat seat, ShowTime showTime) {
		this.seat = seat;
		this.showTime = showTime;
	}
	
	// constructor use for user take show time seat
	public ShowTimeSeat(Seat seat, User bookedBy, ShowTime showTime) {
		this.seat = seat;
		this.bookedBy = bookedBy;
		this.showTime = showTime;
	}
	
	//Get seat name
	public String getSeatName() {
		return seat.getName();
	}

	//Getter and Setter
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

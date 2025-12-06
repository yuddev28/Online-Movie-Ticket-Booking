package model;

import java.time.LocalDateTime;

public class ShowTimeSeat {
	private int id;
	private Seat seat;
	private User bookedBy;
	private ShowTime showTime;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public ShowTimeSeat() {}
	
	// contructor use for get data from db
	public ShowTimeSeat(int id, Seat seat, User bookedBy, ShowTime showTime, LocalDateTime createdAt, LocalDateTime updatedAt) {
		this.id = id;
		this.seat = seat;
		this.bookedBy = bookedBy;
		this.showTime = showTime;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	// constructor use for user take show time seat (user can be null)
	public ShowTimeSeat(Seat seat, User bookedBy, ShowTime showTime) {
		this.seat = seat;
		this.bookedBy = bookedBy;
		this.showTime = showTime;
		this.createdAt = LocalDateTime.now();
		this.updatedAt = createdAt;
	}
	
	
	public int getSeatId() {
		return seat.getId();
	}
	
	public int getUserId() {
		return bookedBy.getId();
	}
	
	public int getShowTimeId() {
		return showTime.getId();
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

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getId() {
		return id;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	
	
	
}

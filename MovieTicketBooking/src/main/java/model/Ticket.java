package model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Ticket {
	private int id;
	private String uid;
	private User user;
	private ShowTime showTime;
	private String seats;
	private BigDecimal totalPrice;
	private PaymentMethod paymentMethod;
	private TicketStatus status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public Ticket() {}
	
	// constructor for get data from db
	public Ticket(int id, String uid, User user, ShowTime showTime, String seats, BigDecimal totalPrice,
			PaymentMethod paymentMethod, TicketStatus status, LocalDateTime createdAt, LocalDateTime updatedAt) {
		this.id = id;
		this.uid = uid;
		this.user = user;
		this.showTime = showTime;
		this.seats = seats;
		this.totalPrice = totalPrice;
		this.paymentMethod = paymentMethod;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	// Getter and Setter
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ShowTime getShowTime() {
		return showTime;
	}

	public void setShowTime(ShowTime showTime) {
		this.showTime = showTime;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public TicketStatus getStatus() {
		return status;
	}

	public void setStatus(TicketStatus status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public String getUid() {
		return uid;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
	public Date getCreatedAtAsDate() {
		return Timestamp.valueOf(createdAt);
	}
	
	public Date getUpdatedAtAsDate() {
		return Timestamp.valueOf(updatedAt);
	}
	
	
}

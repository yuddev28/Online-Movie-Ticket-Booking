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
	private List<ShowTimeSeat> seats;
	private BigDecimal totalPrice;
	private PaymentMethod paymentMethod;
	private TicketStatus status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public Ticket() {}
	
	// constructor for create ticket
	public Ticket(int id, User user, ShowTime showTime, List<ShowTimeSeat> seats, PaymentMethod paymentMethod) {
		this.id = id;
		this.uid = this.generateUid();
		this.user = user;
		this.showTime = showTime;
		this.seats = seats;
		this.totalPrice = this.calculateTotalPrice();
		this.paymentMethod = paymentMethod;
		this.status = TicketStatus.UNPAID;
		this.createdAt = LocalDateTime.now();
		this.updatedAt = createdAt;
	}
	
	// constructor for get data from db
	public Ticket(int id, String uid, User user, ShowTime showTime, List<ShowTimeSeat> seats, BigDecimal totalPrice,
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

	// auto create uid of ticket
	private String generateUid() {
		return showTime.getId() + "-" + user.getId() + "-" + seats.size(); 
	}
	
	// calculate total price of ticket by price per ticket * number of seat
	private BigDecimal calculateTotalPrice() {
		return showTime.getPricePerTicket().multiply(new BigDecimal(seats.size()));
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

	public List<ShowTimeSeat> getSeats() {
		return seats;
	}

	public void setSeats(List<ShowTimeSeat> seats) {
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

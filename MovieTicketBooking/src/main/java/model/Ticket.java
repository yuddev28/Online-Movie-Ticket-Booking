package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class Ticket {
	private int id;
	private String uid;
	private User user;
	private ShowTime showTime;
	private List<ShowtimeSeat> seats;
	private BigDecimal totalPrice;
	private PaymentMethod paymentMethod;
	private TicketStatus status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public Ticket() {}
	
	public Ticket(int id, User user, ShowTime showTime, List<ShowtimeSeat> seats, PaymentMethod paymentMethod) {
		super();
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

	public List<ShowtimeSeat> getSeats() {
		return seats;
	}

	public void setSeats(List<ShowtimeSeat> seats) {
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
	
	
	
}

package model.bean;

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
	private IPayment payment;
	private TicketStatus status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public Ticket(int id, User user, ShowTime showTime, List<ShowtimeSeat> seats, IPayment payment) {
		super();
		this.id = id;
		this.uid = this.generateUid();
		this.user = user;
		this.showTime = showTime;
		this.seats = seats;
		this.totalPrice = this.calculateTotalPrice();
		this.payment = payment;
		this.status = TicketStatus.UNPAID;
		this.createdAt = LocalDateTime.now();
		this.updatedAt = createdAt;
	}

	private String generateUid() {
		return showTime.getId() + "-" + user.getId() + "-" + seats.size(); 
	}
	
	private BigDecimal calculateTotalPrice() {
		return showTime.getPricePerTicket().subtract(new BigDecimal(seats.size()));
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

	public IPayment getPayment() {
		return payment;
	}

	public void setPayment(IPayment payment) {
		this.payment = payment;
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
	
	
}

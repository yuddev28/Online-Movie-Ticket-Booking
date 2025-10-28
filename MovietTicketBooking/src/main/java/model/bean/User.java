package model.bean;
import java.time.LocalDateTime;
import java.util.List;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String phoneNumber;
	private Role role;
	private List<Ticket> tickets;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public User() {}
	
	public User(int id, String username, String password,
			String email, String phoneNumber, Role role,
			List<Ticket> tickets) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.role = role;
		this.tickets = tickets;
		this.createdAt = LocalDateTime.now();
		this.updatedAt = createdAt;
	}

	//Getter and Setter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Ticket> getTickets() {
		return tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
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
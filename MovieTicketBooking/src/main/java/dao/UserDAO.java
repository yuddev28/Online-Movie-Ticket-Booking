package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import model.Role;
import model.Seat;
import model.ShowTime;
import model.ShowTimeSeat;
import model.Ticket;
import model.User;

public class UserDAO implements IUserDAO {
	private ITicketDAO ticketDAO;
	
	public UserDAO() {
		ticketDAO = new TicketDAO();
	}
	
	// Get user by user id
	@Override
	public User getUserById(int id) {
		User user = null;
		try {
			String query = "SELECT * FROM users WHERE user_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(!rs.next()) return null;
			String username;
			String password;
			String email;
			String phoneNumber;
			Role role;
			List<Ticket> tickets = null;
			while (rs.next()) {
				username = rs.getString("username");
				password = rs.getString("password");
				email = rs.getString("email");
				phoneNumber = rs.getString("phonenumber");
				role = Role.valueOf(rs.getString("role"));
				tickets = ticketDAO.getTicketsByUserId(id);
				user = new User(id, username, password, email, phoneNumber, role, tickets);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	// Get user by username
	@Override
	public User getUserByUsername(String username) {
		User user = null;
		try {
			String query = "SELECT * FROM users WHERE username = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			if(!rs.next()) return null;
			int id;
			String password;
			String email;
			String phoneNumber;
			Role role;
			List<Ticket> tickets = null;
			while (rs.next()) {
				id = rs.getInt("user_id");
				password = rs.getString("password");
				email = rs.getString("email");
				phoneNumber = rs.getString("phonenumber");
				role = Role.valueOf(rs.getString("role"));
				tickets = ticketDAO.getTicketsByUserId(id);
				user = new User(id, username, password, email, phoneNumber, role, tickets);
			}
			rs.close();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void addUser(User user) {
		try {
			String query = "INSERT INTO users (username, password, email, phonenumber) VALUES (?, ?, ?, ?);";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setString(1, user.getUsername());
			st.setString(2, user.getPassword());
			st.setString(3, user.getEmail());
			st.setString(4, user.getPhoneNumber());
			st.executeUpdate();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}




}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import model.Role;
import model.ShowTime;
import model.ShowTimeSeat;
import model.Ticket;
import model.User;

public class UserDAO implements IUserDAO {
	
	public UserDAO() {
	}
	

	@Override
	public List<User> getAllUser() {
		List<User> list = new ArrayList<>();
		String query = "SELECT user_id, username, password, email, phonenumber, role FROM users";
		try(Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query)){
			try(ResultSet rs = st.executeQuery()){
				while(rs.next()) {
					list.add(mapResultSetToUser(rs));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
	// Get user by user id
	@Override
	public User getUserById(int id) {
		User user = null;
		try {
			String query = "SELECT user_id, username, password, email, phonenumber, role FROM users WHERE user_id = ?;";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(!rs.next()) return null;
			while (rs.next()) {
				user = mapResultSetToUser(rs);
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
			String query = "SELECT user_id, username, password, email, phonenumber, role FROM users WHERE username = ?;";
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
				user = new User(id, username, password, email, phoneNumber, role);
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
	public boolean addUser(User user) {
		try {
			String query = "INSERT INTO users (username, password, email, phonenumber, role) VALUES (?, ?, ?, ?, ?);";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);
			st.setString(1, user.getUsername());
			st.setString(2, user.getPassword());
			st.setString(3, user.getEmail());
			st.setString(4, user.getPhoneNumber());
			st.setString(5, user.getRole().toString());
			st.executeUpdate();
			st.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	// Map result set to user
	private User mapResultSetToUser(ResultSet rs) {
		User user = null;
		try {
			int id = rs.getInt("user_id");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String email = rs.getString("email");
			String phoneNumber = rs.getString("phonenumber");
			Role role = Role.valueOf(rs.getString("role"));
			user = new User(id, username, password, email, phoneNumber, role);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}

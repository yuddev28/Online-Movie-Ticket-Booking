package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import model.Role;
import model.ShowTime;
import model.ShowTimeSeat;
import model.Ticket;
import model.User;

public class UserDAO implements IUserDAO {
	//private ITicketDAO ticketDAO;

	public UserDAO() {
		//ticketDAO = new TicketDAO();
		
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
			if (!rs.next())
				return null;
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
				
				TicketDAO localTicketDAO = new TicketDAO();
	            List<Ticket> tickets1 = localTicketDAO.getTicketsByUserId(id);
	            
				user = new User(id, username, password, email, phoneNumber, role, tickets1);
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
			if (rs.next()) {
				int id = rs.getInt("user_id");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phonenumber");
				String roleStr = rs.getString("role");
				Role role = (roleStr != null) ? Role.valueOf(roleStr) : Role.USER; // Tránh lỗi null pointer

				TicketDAO ticketDAO = new TicketDAO(); 
	            List<Ticket> tickets = ticketDAO.getTicketsByUserId(id);
				
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

	@Override
	public void updateUser(User user) {
		try {
			// cập nhật email sdt mk dựa trên id
			String query = " UPDATE users SET username = ?, email = ? , phonenumber = ? , password = ? WHERE user_id = ?";
			Connection connect = JDBCConnection.getConnection();
			PreparedStatement st = connect.prepareStatement(query);

			st.setString(1, user.getUsername());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPhoneNumber());
			st.setString(4, user.getPassword());
			st.setInt(5, user.getId());
			

			st.executeUpdate();

			st.close();
			connect.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	// Trong UserDAO.java

	// Hàm kiểm tra email có tồn tại không
	public User getUserByEmail(String email) {
	    User user = null;
	    try {
	        String query = "SELECT * FROM users WHERE email = ?";
	        Connection connect = JDBCConnection.getConnection();
	        PreparedStatement st = connect.prepareStatement(query);
	        st.setString(1, email);
	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	             // Lấy sơ bộ thông tin cần thiết
	             user = new User();
	             user.setId(rs.getInt("user_id"));
	             user.setUsername(rs.getString("username"));
	             user.setEmail(rs.getString("email"));
	             user.setPassword(rs.getString("password"));
	        }
	        rs.close();
	        st.close();
	        connect.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}

}

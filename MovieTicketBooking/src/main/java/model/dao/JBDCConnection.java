package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JBDCConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/YOUR_DATABASE_NAME";
	private static final String USER = "root";
	private static final String PASSWORD = "YOUR_DB_PASSWORD";

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Kết nối
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}

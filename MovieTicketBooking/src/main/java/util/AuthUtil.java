package util;

import dao.IUserDAO;
import dao.UserDAO;
import model.User;

public class AuthUtil {
	// Check user exist
	public static boolean checkUser(String username) {
		if(username == null || username.isBlank()) return false;
		IUserDAO dao = new UserDAO();
		User user = dao.checkUser(username);
		return user != null;
	}
	
	public static User login(String username, String password) {
		IUserDAO dao = new UserDAO();
		User user = dao.checkUser(username);
		try {
			if(user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
				return user;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

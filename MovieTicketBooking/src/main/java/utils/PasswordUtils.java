package utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtils {
	
	private static final int WORK_FACTOR = 10;
	
	// Hash password
	public static String hashPassword(String password) throws Exception {
		if(password == null || password.isBlank()) {
			throw new Exception("Password can't be null or blank");
		}
		return BCrypt.hashpw(password, BCrypt.gensalt(WORK_FACTOR));
	}
	
	// Check password
	public static boolean checkPassword(String password, String hash) {
		if(password == null || hash == null) {
			return false;
		}
		return BCrypt.checkpw(password, hash);
	}
	
}

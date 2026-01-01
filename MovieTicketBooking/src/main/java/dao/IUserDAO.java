package dao;

import java.util.List;

import model.Role;
import model.User;

public interface IUserDAO {
	List<User> getAllUser();
	User getUserById(int id);
	User checkUser(String username);
    boolean addUser(User user);
	
}

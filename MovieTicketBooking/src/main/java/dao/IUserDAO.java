package dao;

import java.util.List;

import model.User;

public interface IUserDAO {
	List<User> getAllUser();
	User getUserById(int id);
	User getUserByUsername(String username);
    boolean addUser(User user);
	
}

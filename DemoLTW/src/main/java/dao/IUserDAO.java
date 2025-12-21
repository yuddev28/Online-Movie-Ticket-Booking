package dao;

import model.User;

public interface IUserDAO {
	User getUserById(int id);
	User getUserByUsername(String username);
    void addUser(User user);
	
}

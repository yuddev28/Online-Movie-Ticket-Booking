package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Cinema;

public interface ICinemaDAO {
	List<Cinema> getAllCinema();
	// Get cinema by id
	Cinema getCinemaById(int id);
	// Add cinema
	boolean addCinema(Cinema cinema);
	// Update cinema
	int updateCinema(int id, Cinema newCinema);
	// Delete cinema by id
	boolean deleteCinemaById(int id) ;
}

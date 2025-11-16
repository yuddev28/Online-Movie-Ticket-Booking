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
	public List<Cinema> getAllCinema();

	// Get cinema by id
	public Cinema getCinemaById(int id);
	
	// Add cinema
	public void addCinema(Cinema cinema);

	// Delete cinema by id
	public int deleteCinemaById(int id) ;
}

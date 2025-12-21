package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Movie;
import model.MovieStatus;

public interface IMovieDAO {
	// Get list of all movies in database
	List<Movie> getAllMovies();

	// Get movie have name contains a string
	List<Movie> getMoviesHaveNameLikeString(String str);

	// Get movie by id
	Movie getMovieById(int id);

	// Add movie to database
	void addMovie(Movie movie);

	// Delete movie by id
	int deleteMovieById(int id);

	// Update movie status by movie id
	int updateMovieStatusById(int id, MovieStatus status);
}

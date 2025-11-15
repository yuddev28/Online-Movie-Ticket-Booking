package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.bean.Movie;
import model.bean.MovieStatus;

public class MovieDAO {
	// Get list of all movies in database
	public List<Movie> getAllMovies() {
		List<Movie> list = new ArrayList<>();
		try {
			// Query string to get data
			String queryString = "SELECT * FROM movies";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery(queryString);
			// Iterate result set to get data
			int id;
			String name;
			String type;
			String directorName;
			String actorsName;
			String description;
			int duration;
			String country;
			String imageUrl;
			MovieStatus movieStatus;
			Movie movie;
			while (rs.next()) {
				id = rs.getInt("movie_id");
				name = rs.getString("movie_name");
				type = rs.getString("movie_type");
				directorName = rs.getString("director_name");
				actorsName = rs.getString("names_of_actors");
				description = rs.getString("movie_description");
				duration = rs.getInt("movie_duration");
				country = rs.getString("movie region");
				imageUrl = rs.getString("movie_image_url");
				movieStatus = MovieStatus.valueOf(rs.getString("movie_status"));
				movie = new Movie(id, name, type, directorName, actorsName, description, duration, country, imageUrl,
						movieStatus);
				list.add(movie);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Get movie have name contains a string
	// Ex: if u want "The walking dead" just type "the walking"
	public List<Movie> getMoviesHaveNameLikeString(String str) {
		List<Movie> list = new ArrayList<>();
		try {
			// Query string to get data
			String queryString = "SELECT * FROM movies WHERE LOWER(title) LIKE ?;";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(queryString);
			ps.setString(1, str);
			ResultSet rs = ps.executeQuery(queryString);
			// Iterate result set to get data
			int id;
			String name;
			String type;
			String directorName;
			String actorsName;
			String description;
			int duration;
			String country;
			String imageUrl;
			MovieStatus movieStatus;
			Movie movie;
			while (rs.next()) {
				id = rs.getInt("movie_id");
				name = rs.getString("movie_name");
				type = rs.getString("movie_type");
				directorName = rs.getString("director_name");
				actorsName = rs.getString("names_of_actors");
				description = rs.getString("movie_description");
				duration = rs.getInt("movie_duration");
				country = rs.getString("movie region");
				imageUrl = rs.getString("movie_image_url");
				movieStatus = MovieStatus.valueOf(rs.getString("movie_status"));
				movie = new Movie(id, name, type, directorName, actorsName, description, duration, country, imageUrl,
						movieStatus);
				list.add(movie);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Get movie by id
	public Movie getMovieById(int id) {
		Movie movie = null;
		try {
			// Query string to get data
			String queryString = "SELECT * FROM movies WHERE movie_id = ?;";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(queryString);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery(queryString);
			// Iterate result set to get data
			String name;
			String type;
			String directorName;
			String actorsName;
			String description;
			int duration;
			String country;
			String imageUrl;
			MovieStatus movieStatus;
			while (rs.next()) {
				name = rs.getString("movie_name");
				type = rs.getString("movie_type");
				directorName = rs.getString("director_name");
				actorsName = rs.getString("names_of_actors");
				description = rs.getString("movie_description");
				duration = rs.getInt("movie_duration");
				country = rs.getString("movie region");
				imageUrl = rs.getString("movie_image_url");
				movieStatus = MovieStatus.valueOf(rs.getString("movie_status"));
				movie = new Movie(id, name, type, directorName, actorsName, description, duration, country, imageUrl,
						movieStatus);
			}
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movie;
	}
	
	// Add movie to database
	public void addMovie(Movie movie) {
		try {
			// Query string to get data
			String queryString = "INSERT INTO movies (movie_name, movie_type, director_name, names_of_actors, movie_description, movie_duration, movie_image_url, movie_status)" 
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(queryString);
			ps.setString(1, movie.getName());
			ps.setString(2, movie.getType());
			ps.setString(3, movie.getDirectorName());
			ps.setString(4, movie.getActorsName());
			ps.setString(5, movie.getDescription());
			ps.setInt(6, movie.getDuration());
			ps.setString(7, movie.getImageUrl());
			ps.setString(8, movie.getMovieStatus().toString());
			ps.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete movie by id
	public int deleteMovieById(int id) {
		int update = 0;
		try {
			// Query string to get data
			String queryString = "DELETE FROM movies WHERE id = ?;";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(queryString);
			ps.setInt(1, id);
			update = ps.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update;
	}
	
	// Update movie status by movie id
	public int updateMovieStatusById(int id, MovieStatus status) {
		int update = 0;
		try {
			// Query string to get data
			String queryString = "UPDATE movies SET movie_status = ? WHERE movie_id = ?";
			// Create connection
			Connection connect = JBDCConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(queryString);
			ps.setString(1, status.toString());
			ps.setInt(2, id);
			update = ps.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update;
	}
}

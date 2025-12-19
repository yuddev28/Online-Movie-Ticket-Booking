package dao;

import java.time.LocalDateTime;
import java.util.List;

import model.Cinema;
import model.Movie;
import model.ShowTime;

public interface IShowTimeDAO {
	// Get all show time
	List<ShowTime> getAllShowTime();
	// Get show time by id
	ShowTime getShowTimeById(int id);
	// Get list of show time by cinema id and movie id and start time
	List<ShowTime> getShowTimeByCinemaAndMovieAndStartDay(int cinemaId, int movieId, LocalDateTime day);
	// Add show time
	boolean addShowTime(ShowTime showTime);
	// Delete show time by id
	boolean deleteShowTimeById(int id);
}

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
	// Get show time in next n days by movie id
	// Ex: day = 7, now = 1/1/2026 => 1/1/2026 to 7/1/2026
	List<ShowTime> getShowTimesByMovieIdAndNextNDays(int movieId, int day);
	// Add show time
	boolean addShowTime(ShowTime showTime);
	// Delete show time by id
	boolean deleteShowTimeById(int id);
}

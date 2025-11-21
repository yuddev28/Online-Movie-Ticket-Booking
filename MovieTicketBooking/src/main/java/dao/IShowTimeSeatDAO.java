package dao;

import java.util.List;

import model.ShowTimeSeat;
import model.User;

public interface IShowTimeSeatDAO {
	List<ShowTimeSeat> getShowTimeSeatsByShowTimeId(int showTimeId);
	List<ShowTimeSeat> getShowTimeSeatsByUserId(int userId);
	void addShowTimeSeats(List<ShowTimeSeat> list);
	void updateShowTimeSeat(int showTimeSeatId, User user);
}

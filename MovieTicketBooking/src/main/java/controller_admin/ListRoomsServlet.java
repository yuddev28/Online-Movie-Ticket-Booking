package controller_admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.RoomDAO;

@WebServlet("/admin/rooms")
public class ListRoomsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-rooms.jsp");
		// If have cinemaId return to room options (for add showtime)
		String cinemaIdStr = request.getParameter("cinemaId");
		if(cinemaIdStr != null && !cinemaIdStr.isBlank()) {
			try {
				int cinemaId = Integer.parseInt(cinemaIdStr);
				List<Room> rooms = new RoomDAO().getRoomByCinemaId(cinemaId);
				request.setAttribute("listRooms", rooms);
		        request.getRequestDispatcher("/WEB-INF/admin/room-options.jsp")
		               .forward(request, response);
			} catch(NumberFormatException e) {
				e.printStackTrace();
			}
			return;
		}
		List<Room> rooms = new RoomDAO().getAllRoom();
		request.setAttribute("listRooms", rooms);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Remove all message in request and session
		request.setAttribute("errorMessage", null);
		HttpSession session = request.getSession();
		String message = (String) session.getAttribute("roomMessage");
		if (message != null)
			session.setAttribute("roomMessage", null);
		doGet(request, response);
	}

}

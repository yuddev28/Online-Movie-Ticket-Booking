package controller;

import dao.ShowTimeDAO;
import dao.ShowTimeSeatDAO;
import model.ShowTime;
import model.ShowTimeSeat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList; // Nhớ import ArrayList
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "SelectSeatServlet", urlPatterns = { "/select-seat" })
public class SelectSeatServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. Kiểm tra đăng nhập
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		try {
			int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
			ShowTimeDAO stDao = new ShowTimeDAO();
			ShowTimeSeatDAO stsDao = new ShowTimeSeatDAO();
			// 2. Lấy thông tin suất chiếu
			ShowTime showTime = stDao.getShowTimeById(showtimeId);
			// 3. Load toàn bộ ghế từ DB
			List<ShowTimeSeat> seatList = stsDao.getShowTimeSeatsByShowTimeId(showtimeId);
			
			List<String> alphabet = new ArrayList<>();
			char c = 'A';
			for(int i = 0; i < showTime.getRoom().getNumberOfRows(); i++) {
				alphabet.add( ((char)(c + i)) + "");
			}
			request.setAttribute("cols", showTime.getRoom().getNumberOfColumns());
			request.setAttribute("alphabet", alphabet);
			request.setAttribute("showTime", showTime);
			request.setAttribute("seatList", seatList);

			request.getRequestDispatcher("/WEB-INF/view/select-seat.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("home");
		}
	}
}

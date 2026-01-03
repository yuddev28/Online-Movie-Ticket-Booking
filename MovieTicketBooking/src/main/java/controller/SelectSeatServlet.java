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
	// ... (các import bên trên)

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

			// --- ĐOẠN CODE QUAN TRỌNG CẦN THÊM ---
			// Tạo danh sách riêng chỉ chứa TÊN các ghế đã có người đặt
			List<String> bookedSeats = new ArrayList<>();
			if (seatList != null) {
				for (ShowTimeSeat seat : seatList) {
					// Kiểm tra: nếu ghế đã có user_id (getBookedBy khác null) thì thêm tên ghế vào
					// list
					if (seat.getBookedBy() != null) {
						bookedSeats.add(seat.getSeatName());
					}
				}
			}
			// Gửi danh sách này sang JSP để so sánh
			request.setAttribute("bookedSeats", bookedSeats);
			// -------------------------------------

			// 4. Sắp xếp ghế (Logic hiển thị)
			Collections.sort(seatList, new Comparator<ShowTimeSeat>() {
				@Override
				public int compare(ShowTimeSeat s1, ShowTimeSeat s2) {
					if (s1.getSeatName().length() != s2.getSeatName().length()) {
						return s1.getSeatName().length() - s2.getSeatName().length();
					}
					return s1.getSeatName().compareTo(s2.getSeatName());
				}
			});

			request.setAttribute("showTime", showTime);
			request.setAttribute("seatList", seatList);

			request.getRequestDispatcher("/WEB-INF/view/select-seat.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("home");
		}
	}
}
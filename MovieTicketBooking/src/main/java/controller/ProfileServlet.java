package controller;

import model.Ticket;
import model.User;
import utils.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import dao.ITicketDAO;
import dao.TicketDAO;
import dao.UserDAO;

@WebServlet("/profile" )
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		ITicketDAO ticketDAO = new TicketDAO();
	    // Lấy danh sách vé của user hiện tại
	    List<Ticket> history = ticketDAO.getTicketsByUserId(user.getId());
	    
	    request.setAttribute("ticketHistory", history);
	    request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
	}

	// XỬ LÝ ĐỔI THÔNG TIN
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập tiếng Việt
		request.setCharacterEncoding("UTF-8");

		// Lấy user từ session
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		
		String email = request.getParameter("email").trim();
		String phone = request.getParameter("phone").trim();
		String currentPass = request.getParameter("currentPass").trim();
		String newPass = request.getParameter("newPass").trim();
		String confirmPass = request.getParameter("confirmPass").trim();
		
		
		// check email
        if (email == null || email.isBlank()) {
            backToPage("Email không được để trống.", request, response);
            return;
        }
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            backToPage("Email không hợp lệ.", request, response);
            return;
        }
        
        // check phonenumber
        if (phone == null || phone.isBlank()) {
            backToPage("Số điện thoại không được để trống.", request, response);
            return;
        }
        if (!phone.matches("^0\\d{9}$")) {
            backToPage("Số điện thoại không hợp lệ", request, response);
            return;
        }
		
		// Xử lý logic Đổi Mật Khẩu
		if (newPass != null && !newPass.isEmpty()) {

			// Kiểm tra mật khẩu hiện tại từ input với mật khẩu hash từ user
			try {
				String currentPassHash = PasswordUtils.hashPassword(currentPass);

				if (!PasswordUtils.checkPassword(currentPass, currentUser.getPassword())) {
					backToPage("Mật khẩu hiện tại không đúng!", request, response);
					return;
				}
				
				// Kiểm tra xác nhận mật khẩu
				if (!newPass.equals(confirmPass)) {
					backToPage("Mật khẩu xác nhận không khớp!", request, response);
					return;
				}

				// Kiểm tra độ dài (Tùy chọn)
				if (newPass.length() < 5) {
					backToPage("Mật khẩu mới phải từ 6 ký tự trở lên!", request, response);
					return;
				}

				// Mã hóa mật khẩu mới và cập nhật vào object User
				String newPassHash = PasswordUtils.hashPassword(newPass);

				currentUser.setPassword(newPassHash);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// Cập nhật các thông tin cá nhân khác
		currentUser.setEmail(email);
		currentUser.setPhoneNumber(phone);

		// lưu xuống Database
		UserDAO dao = new UserDAO();
		dao.updateUser(currentUser); // Bạn cần đảm bảo đã thêm hàm updateUser vào UserDAO như hướng dẫn trước

		// Cập nhật lại Session (để hiển thị thông tin mới ngay lập tức)
		session.setAttribute("user", currentUser);

		// Thông báo thành công và reload trang
		request.setAttribute("message", "Cập nhật thông tin thành công!");
		doGet(request, response);
	}
	
	// Back to register page if fail validation
    private void backToPage(String message, HttpServletRequest request, HttpServletResponse response) {
        try {
        	request.setAttribute("error", message);
			request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

}
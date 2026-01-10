package controller;

import model.User;
import utils.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/profile" )
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Lấy phiên làm việc hiện tại
		HttpSession session = request.getSession();

		// Kiểm tra xem trong session có lưu user chưa (key "user" thường được set
		// khi đăng nhập thành công)
		User user = (User) session.getAttribute("user");

		// Nếu chưa đăng nhập (user là null) -> Chuyển hướng sang trang Login
		if (user == null) {
			// Lưu lại thông báo lỗi để hiện ở trang login nếu muốn
			request.setAttribute("error", "Vui lòng đăng nhập để xem hồ sơ!");
			request.getRequestDispatcher("login").forward(request, response);
			return;
		}

		// Nếu đã đăng nhập -> Chuyển sang trang giao diện profile
		// (Dữ liệu user đã có sẵn trong session, nên bên JSP có thể lấy ra dùng luôn)
		request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
	}

	// XỬ LÝ ĐỔI MẬT KHẨU 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập tiếng Việt
		request.setCharacterEncoding("UTF-8");

		// Lấy user từ session
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");

		// Nếu session hết hạn, bắt đăng nhập lại
		if (currentUser == null) {
			response.sendRedirect("login");
			return;
		}

		// Lấy dữ liệu từ form (giữ nguyên tên tham số như form JSP)
		String newUsername = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String currentPass = request.getParameter("currentPass");
		String newPass = request.getParameter("newPass");
		String confirmPass = request.getParameter("confirmPass");
		
		
		// Xử lý logic Đổi Mật Khẩu (Chỉ chạy khi người dùng nhập mật khẩu mới)
		if (newPass != null && !newPass.isEmpty()) {

			// Kiểm tra mật khẩu hiện tại
			// Mã hóa mật khẩu nhập vào -> so sánh với mật khẩu hash trong User object
			try {
				String currentPassHash = PasswordUtils.hashPassword(currentPass);

				if (!currentUser.getPassword().equals(currentPassHash)) {
					request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
					request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
					return;
				}
				
				// Kiểm tra xác nhận mật khẩu
				if (!newPass.equals(confirmPass)) {
					request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
					request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
					return;
				}

				// Kiểm tra độ dài (Tùy chọn)
				if (newPass.length() < 6) {
					request.setAttribute("error", "Mật khẩu mới phải từ 6 ký tự trở lên!");
					request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
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
		request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
	}

}
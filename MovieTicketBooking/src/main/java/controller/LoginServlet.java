package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
	// GET: Để hiển thị trang đăng nhập
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(req, resp);
    }
	// POST: Xử lý đăng nhập
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String pass = request.getParameter("password");

        UserDAO dao = new UserDAO();
        
        // 1. Lấy thông tin user từ DB dựa vào username
        User user = dao.getUserByUsername(username);

        // 2. Kiểm tra logic đăng nhập
        if (user == null) {
            // Trường hợp: Tài khoản không tồn tại
            request.setAttribute("error", "Tài khoản không tồn tại. <a href='register.jsp'>Đăng ký ngay</a>");
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        } else {
            // Trường hợp: Tài khoản có tồn tại, kiểm tra mật khẩu
        	//mã hóa mật khẩu người dùng vừa nhập vào form để so sánh với dữ liệu mật khẩu được mã hóa dưới database
            //String inputHash	= PasswordUtils.hashPassword(pass);
        	if (user.getPassword().equals(pass)) {
                // Đăng nhập thành công -> Lưu vào Session
                HttpSession session = request.getSession();
                session.setAttribute("user", user); // Lưu đối tượng user để profile.jsp dùng
                
                // Chuyển hướng vào trang Profile hoặc Home
                response.sendRedirect("profile");
            } else {
                // Sai mật khẩu
                request.setAttribute("error", "Sai mật khẩu! Vui lòng thử lại.");
                request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
            }
        }
    }
}
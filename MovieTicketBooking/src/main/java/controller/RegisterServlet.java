package controller;

import dao.UserDAO;
import model.Role;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import utils.PasswordUtils;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

	// Thêm hàm doGet để mở trang đăng ký
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        
        // 1. Lấy dữ liệu từ form (Tiếng Việt)
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String rePass = request.getParameter("confirmPassword");

        // 2. Kiểm tra mật khẩu xác nhận
        if (!pass.equals(rePass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        
        // 3. Kiểm tra xem username đã tồn tại chưa
        if (dao.checkUser(username) != null) {
            request.setAttribute("error", "Tên đăng nhập đã tồn tại! Vui lòng chọn tên khác.");
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            return;
        }
        
        User newUser = new User(username, pass, email, phone, Role.USER);
        dao.addUser(newUser);

        // 5. Đăng ký thành công -> Chuyển sang trang đăng nhập
        response.sendRedirect("login");
    }
}
package controller;

import dao.UserDAO;
import model.User;
import utils.EmailUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest; // Đã dùng đúng tên
import jakarta.servlet.http.HttpServletResponse; // Đã dùng đúng tên
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email); // Cần có hàm getUserByEmail trong UserDAO

        if (user == null) {
            request.setAttribute("error", "Email này chưa được đăng ký trong hệ thống!");
            request.getRequestDispatcher("/WEB-INF/view/forgot-password.jsp").forward(request, response);
        } else {
            // 1. Tạo OTP
            String otp = EmailUtils.generateOTP();
            
            // 2. Gửi Email (Có thể mất vài giây)
            EmailUtils.sendEmail(email, "Mã xác thực quên mật khẩu - MyCinema", "Mã OTP của bạn là: " + otp);
            
            // 3. Lưu OTP và Email vào Session
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("resetEmail", email);
            session.setMaxInactiveInterval(300); // OTP hết hạn sau 5 phút

            // 4. Chuyển hướng sang trang nhập OTP
            response.sendRedirect("verify-otp");
        }
    }
}
package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.PasswordUtils;

@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/reset-password"})
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        // Bảo mật: Nếu chưa xác thực email (chưa có resetEmail trong session) thì đá về login
        if (session.getAttribute("resetEmail") == null) {
            response.sendRedirect("login"); 
            return;
        }
        request.getRequestDispatcher("/WEB-INF/view/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String newPass = request.getParameter("newPass");
        String confirmPass = request.getParameter("confirmPass");
        
        if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/WEB-INF/view/reset-password.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");
        
        if (email != null) {
            UserDAO dao = new UserDAO();
            User user = dao.getUserByEmail(email); // Lấy user từ DB lên
            
            if (user != null) {
                // 1. Mã hóa và cập nhật mật khẩu mới
                try {
					user.setPassword(PasswordUtils.hashPassword(newPass));
					// 2. Lưu xuống DB (Dùng hàm updateUser đã sửa ở bước trước)
	                dao.updateUser(user); 
	                
	                // 3. Xóa session OTP để bảo mật
	                session.removeAttribute("otp");
	                session.removeAttribute("resetEmail");
	                
	                // 4. Thông báo và về trang login
	                request.setAttribute("message", "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.");
	                request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
                
                
            }
        } else {
            response.sendRedirect("login");
        }
    }
}
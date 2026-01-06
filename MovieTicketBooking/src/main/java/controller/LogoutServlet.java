package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// 1. Định nghĩa đường dẫn /logout để khớp với thẻ <a href="logout"> trên header
@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 2. Lấy session hiện tại (nếu có)
        HttpSession session = request.getSession(false);
        
        // 3. Xóa sạch Session -> Đây là lệnh quan trọng nhất để "Quay lại trạng thái chưa đăng nhập"
        if (session != null) {
            session.invalidate(); 
        }
        
        // 4. Chuyển hướng về trang chủ hoặc trang đăng nhập
        response.sendRedirect("home");
    }
}
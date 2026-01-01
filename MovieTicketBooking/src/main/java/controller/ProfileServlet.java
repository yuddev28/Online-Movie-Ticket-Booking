package controller;

import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Lấy phiên làm việc hiện tại (Session)
        HttpSession session = request.getSession();
        
        // 2. Kiểm tra xem trong session có lưu user chưa (key "user" thường được set khi đăng nhập thành công)
        User user = (User) session.getAttribute("user");
        
        // 3. Nếu chưa đăng nhập (user là null) -> Chuyển hướng sang trang Login
        if (user == null) {
            // Lưu lại thông báo lỗi để hiện ở trang login nếu muốn
            request.setAttribute("error", "Vui lòng đăng nhập để xem hồ sơ!");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
        
        // 4. Nếu đã đăng nhập -> Chuyển sang trang giao diện profile
        // (Dữ liệu user đã có sẵn trong session, nên bên JSP có thể lấy ra dùng luôn)
        request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
    }
}
package controller;

import dao.ShowTimeDAO;
import model.ShowTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PaymentSuccessServlet", urlPatterns = {"/payment-success"})
public class PaymentSuccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Cài đặt hiển thị tiếng Việt để in lỗi không bị lỗi font
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        
        // 1. Lấy dữ liệu từ Session
        Object showtimeIdObj = session.getAttribute("success_showtimeId");
        String seats = (String) session.getAttribute("success_seats");
        Object priceObj = session.getAttribute("success_totalPrice");

        // --- KIỂM TRA LỖI 1: Dữ liệu Session bị null ---
        if (showtimeIdObj == null || seats == null) {
            // TẠM THỜI KHÔNG REDIRECT ĐỂ XEM LỖI
            // response.sendRedirect("home");
            
            out.println("<h1>LỖI: Dữ liệu Session bị thiếu!</h1>");
            out.println("<p>Nguyên nhân có thể do:</p>");
            out.println("<ul>");
            out.println("<li>Bạn đang chạy trực tiếp trang này mà không qua bước Checkout.</li>");
            out.println("<li>CheckoutServlet chưa lưu thành công attribute 'success_showtimeId' hoặc 'success_seats'.</li>");
            out.println("</ul>");
            out.println("<p>Giá trị showtimeIdObj: " + showtimeIdObj + "</p>");
            out.println("<p>Giá trị seats: " + seats + "</p>");
            return;
        }

        try {
            int showtimeId = Integer.parseInt(showtimeIdObj.toString());
            
            // 2. Gọi DAO
            ShowTimeDAO showTimeDAO = new ShowTimeDAO();
            ShowTime showTime = showTimeDAO.getShowTimeById(showtimeId); 
            
            // --- KIỂM TRA LỖI 2: DAO trả về null ---
            if (showTime == null) {
                out.println("<h1>LỖI: Không tìm thấy Suất chiếu!</h1>");
                out.println("<p>ShowTimeDAO trả về null cho ID: " + showtimeId + "</p>");
                return;
            }

            request.setAttribute("showTime", showTime);
            request.setAttribute("seats", seats);
            request.setAttribute("totalPrice", priceObj);
            
            // 3. Forward sang View
            request.getRequestDispatcher("/WEB-INF/view/payment-success.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // --- KIỂM TRA LỖI 3: Exception ---
            // response.sendRedirect("home"); // Tạm khóa redirect
            
            out.println("<h1>LỖI HỆ THỐNG (Exception)</h1>");
            out.println("<pre>");
            e.printStackTrace(out); // In chi tiết lỗi ra màn hình trình duyệt
            out.println("</pre>");
        }
    }
}
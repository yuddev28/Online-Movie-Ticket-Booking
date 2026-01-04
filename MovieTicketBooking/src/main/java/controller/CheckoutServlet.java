package controller;

import dao.ShowTimeDAO;
import dao.TicketDAO;
import model.ShowTime;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // String action = request.getParameter("action");
        
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            // Nếu chưa đăng nhập hoặc Session bị mất -> Về trang Login ngay
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        
        // Nếu là hành động thanh toán
        if ("PAY".equals(action)) {
            processPayment(request, response);
            return;
       
        }

        try {
            String showtimeIdStr = request.getParameter("showtimeId");
            String selectedSeats = request.getParameter("selectedSeats");
            String totalPrice = request.getParameter("totalPrice");

           
            if (showtimeIdStr != null) { 
                int id = Integer.parseInt(showtimeIdStr);
                ShowTimeDAO showTimeDAO = new ShowTimeDAO();
                // Lấy thông tin chi tiết suất chiếu (Phim, Rạp, Giờ...) từ DB
                ShowTime showTime = showTimeDAO.getShowTimeById(id);
                
                // Gửi đối tượng ShowTime sang JSP
                request.setAttribute("showTime", showTime);
            }
            // -----------------------------

            request.setAttribute("showtimeId", showtimeIdStr);
            request.setAttribute("selectedSeats", selectedSeats);
            request.setAttribute("totalPrice", totalPrice);

            request.getRequestDispatcher("/WEB-INF/view/checkout.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }

    private void processPayment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) { response.sendRedirect("login"); return; }

        try {
            int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
            String seatsStr = request.getParameter("selectedSeats");
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            String paymentMethod = request.getParameter("paymentMethod");
            
            // Xử lý chuỗi ghế (ví dụ: "A1,A2" -> ["A1", "A2"])
            String[] seats = seatsStr.split(",");
            
            TicketDAO dao = new TicketDAO();
            // Lưu vé vào Database
            boolean success = dao.saveBooking(user, showtimeId, seats, totalPrice, paymentMethod);
    
            if (success) {
                // --- SỬA TẠI ĐÂY ---
                // Chuyển hướng sang trang PaymentSuccessServlet vừa tạo
            	// Lưu thông tin vào session để hiển thị ở trang Success
                
                session.setAttribute("success_showtimeId", showtimeId);
                session.setAttribute("success_seats", seatsStr); // Chuỗi ghế ví dụ "A1,A2"
                session.setAttribute("success_totalPrice", totalPrice);
                
                // Chuyển hướng sang Servlet mới (Pattern PRG: Post-Redirect-Get)
                // Giúp tránh việc người dùng F5 làm thanh toán lại 2 lần
                response.sendRedirect("payment-success");
            } else {
                request.setAttribute("error", "Lỗi thanh toán! Ghế có thể đã bị người khác đặt.");
                request.setAttribute("showtimeId", String.valueOf(showtimeId));
                request.setAttribute("selectedSeats", seatsStr);
                request.setAttribute("totalPrice", String.valueOf(totalPrice));
                request.getRequestDispatcher("/WEB-INF/view/checkout.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/view/checkout.jsp").forward(request, response);
        }
    }
}
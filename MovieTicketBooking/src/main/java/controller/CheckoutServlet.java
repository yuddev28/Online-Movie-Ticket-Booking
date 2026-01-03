package controller;

import dao.TicketDAO;
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
        String action = request.getParameter("action");
        
        // Nếu là hành động thanh toán
        if ("PAY".equals(action)) {
            processPayment(request, response);
            return;
        }

        // Mặc định: Hiển thị trang Checkout (giữ nguyên logic cũ)
        String showtimeId = request.getParameter("showtimeId");
        String selectedSeats = request.getParameter("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");

        request.setAttribute("showtimeId", showtimeId);
        request.setAttribute("selectedSeats", selectedSeats);
        request.setAttribute("totalPrice", totalPrice);

        request.getRequestDispatcher("/WEB-INF/view/checkout.jsp").forward(request, response);
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
            response.sendRedirect("home");
        }
    }
}
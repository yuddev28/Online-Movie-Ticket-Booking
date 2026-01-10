package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/verify-otp")
public class VerifyOTPServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/verify-otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String inputOtp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("otp");

        if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
            // OTP đúng -> Cho phép đổi mật khẩu (Chuyển sang trang reset)
            response.sendRedirect("reset-password");
        } else {
            // OTP sai
            request.setAttribute("error", "Mã OTP không chính xác hoặc đã hết hạn!");
            request.getRequestDispatcher("/WEB-INF/view/verify-otp.jsp").forward(request, response);
        }
    }
}
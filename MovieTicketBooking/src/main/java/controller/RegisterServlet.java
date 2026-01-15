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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	// Thêm hàm doGet để mở trang đăng ký
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  Get input data
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String pass = request.getParameter("password").trim();
        String rePass = request.getParameter("confirmPassword").trim();

        // check input validation
        // check username
        if(username == null || username.isBlank()) {
        	backToPage("Vui lòng nhập tên đăng nhập!", request, response);
            return;
        }
        if(!username.matches("^[a-z0-9]+$")) {
        	backToPage("Tên đăng nhập chỉ gồm chữ thường và số.", request, response);
            return;
        }
        if(username.length() < 3 || username.length() > 30) {
        	backToPage("Tên đăng nhập phải có độ dài 3-20 kí tự.", request, response);
            return;
        }
        // check username is exist
        UserDAO dao = new UserDAO();
        if (dao.checkUser(username) != null) {
            backToPage("Tên đăng nhập đã tồn tại! Vui lòng chọn tên khác.", request, response);
            return;
        }
        
        // check email
        if (email == null || email.isBlank()) {
            backToPage("Email không được để trống.", request, response);
            return;
        }
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            backToPage("Email không hợp lệ.", request, response);
            return;
        }
        
        // check phonenumber
        if (phone == null || phone.isBlank()) {
            backToPage("Số điện thoại không được để trống.", request, response);
            return;
        }
        if (!phone.matches("^0\\d{9}$")) {
            backToPage("Số điện thoại không hợp lệ", request, response);
            return;
        }
        
        // check password
        if (pass == null || pass.length() == 0) {
            backToPage("Mật khẩu không được để trống.", request, response);
            return;
        }
        if (pass.length() > 40) {
            backToPage("Mật khẩu tối đa 40 kí tự.", request, response);
            return;
        }
        if (!pass.matches("^[a-z0-9]+$")) {
            backToPage("Mật khẩu chỉ được chứa chữ thường và số.", request, response);
            return;
        } 
        if (!pass.equals(rePass)) {
            backToPage("Mật khẩu xác nhận không khớp!", request, response);
            return;
        }

        User newUser = new User(username, pass, email, phone, Role.USER);
        dao.addUser(newUser);
        response.sendRedirect("login");
    }
    
    // Back to register page if fail validation
    private void backToPage(String message, HttpServletRequest request, HttpServletResponse response) {
        try {
        	request.setAttribute("error", message);
			request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
}
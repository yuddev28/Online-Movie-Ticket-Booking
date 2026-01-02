package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.UserDAO;


@WebServlet("/admin/user/delete")
public class DeleteAccountServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("userMessage", "ID không hợp lệ!");
            response.sendRedirect(request.getContextPath() + "/admin/users");
            return;
        }
        
        boolean res = new UserDAO().deleteUser(id);

        HttpSession session = request.getSession();
        session.setAttribute("userMessage", (res) ? "Xoá user thành công!" : "Xoá user thất bại!");

        response.sendRedirect(request.getContextPath() + "/admin/rooms");
	}

}

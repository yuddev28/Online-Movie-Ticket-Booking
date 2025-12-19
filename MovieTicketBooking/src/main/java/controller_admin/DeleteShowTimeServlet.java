package controller_admin;

import java.io.IOException;

import dao.ShowTimeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/showtime/delete")
public class DeleteShowTimeServlet extends HttpServlet {
	
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
            request.getSession().setAttribute("showtimeMessage", "ID không hợp lệ!");
            response.sendRedirect(request.getContextPath() + "/admin/showtimes");
            return;
        }
        
        boolean res = new ShowTimeDAO().deleteShowTimeById(id);

        HttpSession session = request.getSession();
        session.setAttribute("roomMessage", res ? "Xoá suất chiếu thành công!" : "Xoá suất chiếu thất bại!");

        response.sendRedirect(request.getContextPath() + "/admin/showtimes");
	}

}


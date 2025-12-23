package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.CinemaDAO;

@WebServlet("/admin/cinema/delete")
public class DeleteCinemaServlet extends HttpServlet {
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
            request.getSession().setAttribute("movieMessage", "ID không hợp lệ!");
            response.sendRedirect(request.getContextPath() + "/admin/cinemas");
            return;
        }
        
        boolean res = new CinemaDAO().deleteCinemaById(id);

        HttpSession session = request.getSession();
        if (res) {
            session.setAttribute("movieMessage", "Xoá rạp thành công!");
        } else {
            session.setAttribute("movieMessage", "Xoá rạp thất bại!");
        }

        response.sendRedirect(request.getContextPath() + "/admin/cinemas");
	}

}

package controller_admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.CinemaDAO;
import dao.RoomDAO;

@WebServlet("/admin/room/delete")
public class DeleteRoomServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("roomMessage", "ID không hợp lệ!");
            response.sendRedirect(request.getContextPath() + "/admin/rooms");
            return;
        }
        
        int res = new RoomDAO().deleteRoomById(id);

        HttpSession session = request.getSession();
        if (res != 0) {
            session.setAttribute("roomMessage", "Xoá phòng thành công!");
        } else {
            session.setAttribute("roomMessage", "Xoá phòng thất bại!");
        }

        response.sendRedirect(request.getContextPath() + "/admin/rooms");
	}

}

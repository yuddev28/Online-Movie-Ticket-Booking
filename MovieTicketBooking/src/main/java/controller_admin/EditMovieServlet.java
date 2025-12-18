package controller_admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Movie;
import model.MovieStatus;

import java.io.IOException;
import java.util.List;

import dao.IMovieDAO;
import dao.MovieDAO;

@WebServlet("/admin/movie/edit")
public class EditMovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-editmovie.jsp");
		// Check session if first time to edit movie remove all error message
		HttpSession session = request.getSession();
		if(session.getAttribute("editmovie") == null) {
			String message = (String) session.getAttribute("errorMessage");
			if(message != null) session.setAttribute("errorMessage", "");
			session.setAttribute("editmovie", 1);
		}
		// Get movie by id and put it to view
		IMovieDAO mDAO = new MovieDAO();
		String idPara = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idPara);
		} catch(NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/movies");
			e.printStackTrace();
		}
		Movie movie = mDAO.getMovieById(id);
		request.setAttribute("movie", movie);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handlerUpdate(request, response);
		HttpSession session = request.getSession();
		session.setAttribute("editmovie", null);
		response.sendRedirect(request.getContextPath() + "/admin/movies");
	}
	
	// Handler update movie
	private void handlerUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		try {
			// Get parameter and check error
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			if(name == null || name.isBlank()) {
				backToEditPage(request, response, "Thiếu tên phim");
				return;
			}
			String type = request.getParameter("type");
			if(type == null || type.isBlank()) {
				backToEditPage(request, response, "Thiếu thể loại");
				return;
			}
		    String directorName = request.getParameter("directorName");
		    if(directorName == null || directorName.isBlank()) {
				backToEditPage(request, response, "Thiếu tên đạo diễn");
				return;
			}
		    String actorsName = request.getParameter("actorsName");
		    if(actorsName == null || actorsName.isBlank()) {
				backToEditPage(request, response, "Thiếu tên các diễn viên");
				return;
			}
		    String durationStr = request.getParameter("duration");
		    if(durationStr == null || durationStr.isBlank()) {
				backToEditPage(request, response, "Thiếu thời lượng phim");
				return;
			}
		    int duration = Integer.parseInt(durationStr);
		    if(duration < 0) {
		    	backToEditPage(request, response, "Thời lượng phim phải dương");
				return;
		    }
		    String country = request.getParameter("country");
		    if(country == null || country.isBlank()) {
				backToEditPage(request, response, "Thiếu tên quốc gia");
				return;
			}
		    String imageUrl = request.getParameter("imageUrl");
		    if(imageUrl == null || imageUrl.isBlank()) {
				backToEditPage(request, response, "Thiếu đường dẫn hình");
				return;
			}
		    String status = request.getParameter("status");
		    String description = request.getParameter("description");
		    Movie movie = new Movie(name, type, directorName, actorsName, description, duration, country, imageUrl, MovieStatus.valueOf(status));
		    int update = new MovieDAO().updateMovie(id, movie);
		    // Put message to session
		    HttpSession session = request.getSession();
			String message = (String) session.getAttribute("errorMessage");
			if(message != null) session.setAttribute("errorMessage", message);
			// check movie have update in database
		    if(update > 0) {
			    session.setAttribute("movieMessage", "Cập nhật thành công!");
		    } else {
		    	session.setAttribute("movieMessage", "Không cập nhật!");
		    }
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	// Back to edit page for edit again
	private void backToEditPage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("errorMessage", message);
		doGet(request, response);
		return;
	}

}

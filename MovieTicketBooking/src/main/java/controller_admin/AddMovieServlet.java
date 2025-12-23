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

import dao.IMovieDAO;
import dao.MovieDAO;

@WebServlet("/admin/movie/add")
public class AddMovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageView", "/WEB-INF/admin/admin-addmovie.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/admin-layout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handlerAdd(request, response);
		response.sendRedirect(request.getContextPath() + "/admin/movies");
	}
	
	private void handlerAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			if(name == null || name.isBlank()) {
				backToAddPage(request, response, "Thiếu tên phim");
				return;
			}
			String type = request.getParameter("type");
			if(type == null || type.isBlank()) {
				backToAddPage(request, response, "Thiếu thể loại");
				return;
			}
		    String directorName = request.getParameter("directorName");
		    if(directorName == null || directorName.isBlank()) {
		    	backToAddPage(request, response, "Thiếu tên đạo diễn");
				return;
			}
		    String actorsName = request.getParameter("actorsName");
		    if(actorsName == null || actorsName.isBlank()) {
		    	backToAddPage(request, response, "Thiếu tên các diễn viên");
				return;
			}
		    String durationStr = request.getParameter("duration");
		    if(durationStr == null || durationStr.isBlank()) {
		    	backToAddPage(request, response, "Thiếu thời lượng phim");
				return;
			}
		    int duration = Integer.parseInt(durationStr);
		    if(duration < 0) {
		    	backToAddPage(request, response, "Thời lượng phim phải dương");
				return;
		    }
		    String country = request.getParameter("country");
		    if(country == null || country.isBlank()) {
		    	backToAddPage(request, response, "Thiếu tên quốc gia");
				return;
			}
		    String imageUrl = request.getParameter("imageUrl");
		    if(imageUrl == null || imageUrl.isBlank()) {
		    	backToAddPage(request, response, "Thiếu đường dẫn hình");
				return;
			}
		    String status = request.getParameter("status");
		    String description = request.getParameter("description");
		    Movie movie = new Movie(name, type, directorName, actorsName, description, duration, country, imageUrl, MovieStatus.valueOf(status));
		    boolean res = new MovieDAO().addMovie(movie);
		    // Put message to session
		    HttpSession session = request.getSession();
		    if(res) {
			    session.setAttribute("movieMessage", "Thêm phim thành công!");
		    }else {
		    	session.setAttribute("movieMessage", "Thêm phim thất bại!");
		    }
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
	}

	private void backToAddPage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
		request.setAttribute("errorMessage", message);
		doGet(request, response);
	}

}

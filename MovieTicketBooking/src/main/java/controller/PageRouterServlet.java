package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// Map các URL cho trang tĩnh
@WebServlet(name = "PageRouterServlet", urlPatterns = {"/about", "/contact", "/news"})
public class PageRouterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        
        switch (path) {
            case "/about":
                request.getRequestDispatcher("/WEB-INF/view/about.jsp").forward(request, response);
                break;
            case "/contact":
                request.getRequestDispatcher("/WEB-INF/view/contact.jsp").forward(request, response);
                break;
            case "/news":
                 // Nếu chưa có file news.jsp thì bỏ case này hoặc tạo file
                request.getRequestDispatcher("/WEB-INF/view/news.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("home");
                break;
        }
    }
}
package com.movieheram.controller;

import com.movieheram.model.MovieModel;
import com.movieheram.model.UserModel;
import com.movieheram.service.FavoriteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.movieheram.util.SessionUtil;

/**
 * FavoriteController is responsible for handling favorite page. It interacts with
 * the FavoriteService to  get the favorited movie by a user.
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/favorite" })
public class FavoriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FavoriteService favoriteService;

    /**
	 * Constructor initializes the FavoriteService.
	 */
    public void init() throws ServletException {
        favoriteService = new FavoriteService();
    }
    /**
	 * Handles GET requests to the favorite page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); 
  
     // Get the user ID from the session
    	UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
    	if (sessionUser == null) {
    	    response.sendRedirect("login"); 
    	    return;
    	}
    	int userId = sessionUser.getId();

        // Get favorite movies from service
        List<MovieModel> favoriteMovies = favoriteService.getFavoriteMovies(userId);
        request.setAttribute("movieList", favoriteMovies); 

        request.getRequestDispatcher("/WEB-INF/pages/favorite.jsp").forward(request, response);
    }
    
    /**
	 * Handles POST requests for favorite login.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
         // Get the user ID from the session
            UserModel sessionUser = (UserModel) session.getAttribute("user");
        	if (sessionUser == null) {
        	    response.sendRedirect("login"); // or getStarted
        	    return;
        	}
        	int userId = sessionUser.getId();

            int movieId = Integer.parseInt(request.getParameter("movieId"));

            favoriteService.toggleFavorite(userId, movieId);

            // Redirect back to the referring page
            String redirect = request.getParameter("redirect");
            response.sendRedirect(redirect != null ? redirect : "home");
            
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
    }
}
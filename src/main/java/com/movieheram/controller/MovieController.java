package com.movieheram.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

import com.movieheram.model.MovieModel;
import com.movieheram.model.UserModel;
import com.movieheram.service.MovieService;
import com.movieheram.service.FavoriteService;

/**
 * MovieController is responsible for handling cartoon page. It interacts with
 * the MovieService and FavoriteService to  list the specific movie types and favorite the content.
 */
@WebServlet(asyncSupported = true, name = "Movie", urlPatterns = { "/movie" })
public class MovieController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
	 * Handles GET requests to the movie page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

    	MovieService movieService = new MovieService();
    	FavoriteService favoriteService = new FavoriteService();

    	List<MovieModel> movieList = movieService.getMovies();
    	String genre = request.getParameter("genre");
    	String year = request.getParameter("year");
    	if ((genre == null || genre.isEmpty()) && (year == null || year.isEmpty())) {
    	    movieList = movieService.getMovies();
    	} else {
    	    movieList = movieService.getMovieFiltered(genre, year);
    	}
    	
    	// Get the user ID from the session
    	
    	UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
    	if (sessionUser == null) {
    	    response.sendRedirect("login");
    	    return;
    	}
    	int userId = sessionUser.getId();
    	

        for (MovieModel movie : movieList) {
            boolean isFav = favoriteService.isFavorite(userId, movie.getMovieID());
            movie.setIsFav(isFav);  
        }

        
    	request.setAttribute("movieList", movieList);
        request.getRequestDispatcher("/WEB-INF/pages/movie.jsp").forward(request, response);
    }
    
    /**
	 * Handles POST requests to the movie page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


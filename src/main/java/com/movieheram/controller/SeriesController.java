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
import com.movieheram.service.FavoriteService;
import com.movieheram.service.MovieService;

/**
 * SeriesController is responsible for handling cartoon page. It interacts with
 * the MovieService and FavoriteService to  list the specific series types and favorite the content.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/series" })
public class SeriesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeriesController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * Handles GET requests to the series page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		MovieService movieService = new MovieService();
    	FavoriteService favoriteService = new FavoriteService();

    	List<MovieModel> movieList = movieService.getSeries();
    	String genre = request.getParameter("genre");
    	String year = request.getParameter("year");
    	if ((genre == null || genre.isEmpty()) && (year == null || year.isEmpty())) {
    	    movieList = movieService.getSeries();
    	} else {
    	    movieList = movieService.getSeriesFiltered(genre, year);
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
	    request.getRequestDispatcher("/WEB-INF/pages/series.jsp").forward(request, response);
	}

    /**
	 * Handles GET requests to the series page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

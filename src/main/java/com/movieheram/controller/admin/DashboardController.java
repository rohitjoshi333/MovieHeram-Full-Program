package com.movieheram.controller.admin;

import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

import com.movieheram.model.MovieModel;
import com.movieheram.model.UserModel;
import com.movieheram.service.DashboardService;
import com.movieheram.service.FavoriteService;
import com.movieheram.util.ImageUtil;
import com.movieheram.util.VideoUtil;

/**
 * DashboardController handles the admin part which consist of
 * listing the total user, contents, types,
 * user management page
 * movie management page
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard"})
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1MB
	    maxFileSize = 1024 * 1024 * 100,  // 100MB
	    maxRequestSize = 1024 * 1024 * 150 // 150MB
	)
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * Handles GET requests to the admin page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Optional: Check if admin is logged in
	    Object userObj = request.getSession().getAttribute("user");

	    if (userObj == null) {
	        response.sendRedirect("login");
	        return;
	    }

	    // Forward to the admin dashboard JSP
	    
	    DashboardService dashboardService = new DashboardService();

	    String action = request.getParameter("action");
	    
	    //Activates if view is clicked
	    if ("viewFavorites".equals(action)) {
	        int userId = Integer.parseInt(request.getParameter("userId"));
	        FavoriteService favoriteService = new FavoriteService();
	        
	        List<MovieModel> favorites = favoriteService.getFavoriteMovies(userId);
	        UserModel selectedUser = dashboardService.getUserById(userId); 	
	        
	        request.setAttribute("viewedUserId", userId);
	        request.setAttribute("selectedFavorites", favorites);
	    }

	    //Activates if delete user is clicked
	    if ("deleteUser".equals(action)) {
	    	try {
	            int deleteUserId = Integer.parseInt(request.getParameter("id"));
	            boolean deleted = dashboardService.deleteUser(deleteUserId);
	            response.sendRedirect("dashboard?section=user&msg=" + (deleted ? "deleteU_success" : "deleteU_fail"));
	            return;
	        } catch (NumberFormatException | NullPointerException e) {
	            response.sendRedirect("dashboard?section=user&msg=deleteU_error");
	            return;
	        }
	    }
	   
	    //Activates if delete movie is clicked
	    if ("deleteMovie".equals(action)) {

	    	try {
	            int deleteMovieId = Integer.parseInt(request.getParameter("movieID"));
	            boolean deletedMovie = dashboardService.deleteMovie(deleteMovieId);
	            response.sendRedirect("dashboard?section=movie&msg=" + (deletedMovie ? "deleteM_success" : "deleteM_fail"));
	            return;

	        } catch (NumberFormatException | NullPointerException e) {
	        	 response.sendRedirect("dashboard?section=movie&msg=deleteM_error");
		          return;
		        }	            
	        }
	  
	    //activates if edit movie is clicked
	    if ("editMovie".equals(action)) {
	        int movieID = Integer.parseInt(request.getParameter("movieID"));
	        MovieModel movie = dashboardService.getMovieById(movieID); 
	        request.setAttribute("editMovie", movie); // Pass to JSP
		    }
		    
		    String msg = request.getParameter("msg");
		    String section = request.getParameter("section");
	
		    if (msg != null && "user".equals(section)) {
		        switch (msg) {
			        case "deleteU_success": request.setAttribute("userMessage", "User deleted successfully!"); break;
		            case "deleteU_fail": request.setAttribute("userMessage", "Failed to delete user."); break;
		            case "deleteU_error": request.setAttribute("userMessage", "Something went wrong while deleting."); break;
		        }
		    }
		            else if (msg != null && "movie".equals(section)){
		            	switch (msg) {
		            case "add_success": request.setAttribute("movieMessage", "Movie added successfully!"); break;
		            case "add_fail": request.setAttribute("movieMessage", "Failed to add movie."); break;
		            case "deleteM_success": request.setAttribute("movieMessage", "Movie deleted successfully!"); break;
		            case "deleteM_fail": request.setAttribute("movieMessage", "Failed to delete movie."); break;
		            case "deleteM_error": request.setAttribute("movieMessage", "Something went wrong while deleting."); break;
		            case "update_success": request.setAttribute("movieMessage", "Movie updated successfully!"); break;
		            case "update_fail": request.setAttribute("movieMessage", "Failed to update movie."); break;
		            case "update_error": request.setAttribute("movieMessage", "Something went wrong while updating."); break;
		            	}
	        }
	    
	    int userCount = dashboardService.getUserCount();
	    int allContentCount = dashboardService.getAllMovieCount();
	    int movieCount = dashboardService.getMovieCount();
	    int seriesCount = dashboardService.getSeriesCount();
	    int animeCount = dashboardService.getAnimeCount();
	    int standardCount = dashboardService.getStandardCount();
	    int premiumCount = dashboardService.getPremiumCount();
	    int premiumPlusCount = dashboardService.getPremiumPlusCount();

	    
	    request.setAttribute("users", dashboardService.getAllUsers());
	    request.setAttribute("movies", dashboardService.getAllMovies());
	    request.setAttribute("userCount", userCount);
	    request.setAttribute("allMovieCount", allContentCount);
	    request.setAttribute("movieCount", movieCount);
	    request.setAttribute("seriesCount", seriesCount);
	    request.setAttribute("animeCount", animeCount);
	    request.setAttribute("standardCount", standardCount);
	    request.setAttribute("premiumCount", premiumCount);
	    request.setAttribute("premiumPlusCount", premiumPlusCount);
	    request.getRequestDispatcher("/WEB-INF/pages/admin/dashboard.jsp").forward(request, response);
	}
	

    /**
	 * Handles POST requests to the admin page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {

		    String action = request.getParameter("action");
		    DashboardService dashboardService = new DashboardService();
		    
		    //Activates if add movie is clicked
		    if ("addMovie".equals(action)) {
		        boolean added = DashboardService.addMovie(request);
		        // Redirect to GET to avoid re-submission
		        response.sendRedirect("dashboard?section=movie&msg=" + (added ? "add_success" : "add_fail"));
		        return;
		    }
		    
		    //Activates if update movie is clicked.
		    if ("updateMovie".equals(action)) {
		        try {
		            int movieID = Integer.parseInt(request.getParameter("movieID"));
		            String title = request.getParameter("title");
		            String genre = request.getParameter("genre");
		            String type = request.getParameter("type");
		            int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));

		            MovieModel existing = dashboardService.getMovieById(movieID);

		            String thumbnail = request.getParameter("thumbnailUrl");
		            Part thumbnailPart = request.getPart("thumbnailFile");
		            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
		                thumbnail = new ImageUtil().uploadImage(thumbnailPart, "movie");
		            } else if (thumbnail == null || thumbnail.isEmpty()) {
		                thumbnail = existing.getThumbnail();
		            }

		            String video = "";
		            Part videoPart = request.getPart("video");
		            if (videoPart != null && videoPart.getSize() > 0) {
		                video = VideoUtil.saveFile(videoPart);
		            } else {
		                video = existing.getVideo();
		            }

		            MovieModel movie = new MovieModel(movieID, title, genre, type, releaseYear, thumbnail, video);
		            boolean updated = dashboardService.updateMovie(movie);

		            response.sendRedirect("dashboard?section=movie&msg=" + (updated ? "update_success" : "update_fail"));
		            return;
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.sendRedirect("dashboard?section=movie&msg=update_error");
		            return;
		        }
		    }

		doGet(request, response);
	}

}

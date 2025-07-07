package com.movieheram.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.movieheram.config.DbConfig;
import com.movieheram.model.MovieModel;

/**
 * Service class for handling favorite operations.
 * Connects to the database.
 */

public class FavoriteService {
	
	private static Connection dbConn;
    private boolean isConnectionError = false;
    
    /**
	 * Constructor that initializes the database connection. Sets the connection
	 * error flag if the connection fails.
	 */
    
    public FavoriteService() {
    	try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

   

	public boolean toggleFavorite(int userId, int movieId) {
	    try {
	    	
	        PreparedStatement checkStmt = dbConn.prepareStatement("SELECT * FROM favorite WHERE Movie_ID=? AND User_ID=?");
	        checkStmt.setInt(1, movieId);
	        checkStmt.setInt(2, userId);
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next()) {
	            // Exists: remove
	            PreparedStatement del = dbConn.prepareStatement("DELETE FROM favorite WHERE Movie_ID=? AND User_ID=?");
	            del.setInt(1, movieId);
	            del.setInt(2, userId);
	            del.executeUpdate();
	            return false; // removed
	        } else {
	            // Not exists: insert
	            PreparedStatement insert = dbConn.prepareStatement("INSERT INTO favorite (Movie_ID, User_ID) VALUES (?, ?)");
	            insert.setInt(1, movieId);
	            insert.setInt(2, userId);
	            insert.executeUpdate();
	            return true; // added
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	public List<MovieModel> getFavoriteMovies(int userId) {
        List<MovieModel> favorites = new ArrayList<>();
        try  {
            PreparedStatement ps = dbConn.prepareStatement(
                "SELECT m.* FROM movie m INNER JOIN favorite f ON m.Movie_ID = f.Movie_ID WHERE f.User_ID = ?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MovieModel movie = mapMovieFromResultSet(rs);
                movie.setIsFav(true);
                favorites.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return favorites;
    }
	
	public boolean isFavorite(int userId, int movieId) {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT 1 FROM favorite WHERE Movie_ID=? AND User_ID=?");
            ps.setInt(1, movieId);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	private MovieModel mapMovieFromResultSet(ResultSet rs) throws SQLException {
        MovieModel movie = new MovieModel();
        movie.setMovieID(rs.getInt("Movie_ID"));
        movie.setTitle(rs.getString("Title"));
        movie.setGenre(rs.getString("Genre"));
        movie.setType(rs.getString("Type"));
        movie.setReleaseYear(rs.getInt("Release_Year"));
        movie.setThumbnail(rs.getString("Thumbnail"));
        movie.setVideo(rs.getString("Video"));
        return movie;
    }
	
	public List<MovieModel> getAllMoviesWithFavoriteStatus(int userId) {
        List<MovieModel> movies = new ArrayList<>();
        try {
            // First get all movies
            PreparedStatement psAll = dbConn.prepareStatement("SELECT * FROM movie");
            ResultSet rsAll = psAll.executeQuery();
            
            while (rsAll.next()) {
                MovieModel movie = mapMovieFromResultSet(rsAll);
                // Check if it's a favorite
                movie.setIsFav(isFavorite(userId, movie.getMovieID()));
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }
}

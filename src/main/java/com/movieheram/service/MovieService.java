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
 * Service class for handling movie operations.
 * Connects to the database, gets movie, filters, search. 
 */

public class MovieService {
	private static Connection dbConn;
    private boolean isConnectionError = false;
    
    /**
	 * Constructor that initializes the database connection. Sets the connection
	 * error flag if the connection fails.
	 */
    
 public  MovieService(){
	try {
        dbConn = DbConfig.getDbConnection();
    } catch (SQLException | ClassNotFoundException ex) {
        ex.printStackTrace();
        isConnectionError = true;
    }
}

 	/**
	 * Retrieves all movie information from the database.
	 * 
	 * @return A list of MovieModel objects containing student data. Returns null
	 *         if there is a connection error or if an exception occurs during query
	 *         execution.
	 */
    

	public List<MovieModel> getAllMovies() {
        List<MovieModel> movies = new ArrayList<>();
        String sql = "SELECT * FROM movie";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MovieModel movie = new MovieModel();
                movie.setMovieID(rs.getInt("Movie_ID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setType(rs.getString("Type"));
                movie.setReleaseYear(rs.getInt("Release_Year"));
                movie.setThumbnail(rs.getString("Thumbnail"));
                movie.setVideo(rs.getString("Video"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }
    
	public List<MovieModel> getMovies() {
        List<MovieModel> movies = new ArrayList<>();
        String sql = "SELECT * FROM movie WHERE Type = 'Movie' ";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MovieModel movie = new MovieModel();
                movie.setMovieID(rs.getInt("Movie_ID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setType(rs.getString("Type"));
                movie.setReleaseYear(rs.getInt("Release_Year"));
                movie.setThumbnail(rs.getString("Thumbnail"));
                movie.setVideo(rs.getString("Video"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }
    
	public List<MovieModel> getSeries() {
        List<MovieModel> movies = new ArrayList<>();
        String sql = "SELECT * FROM movie WHERE Type = 'Series' ";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MovieModel movie = new MovieModel();
                movie.setMovieID(rs.getInt("Movie_ID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setType(rs.getString("Type"));
                movie.setReleaseYear(rs.getInt("Release_Year"));
                movie.setThumbnail(rs.getString("Thumbnail"));
                movie.setVideo(rs.getString("Video"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

	public List<MovieModel> getAnime() {
        List<MovieModel> movies = new ArrayList<>();
        String sql = "SELECT * FROM movie WHERE Type = 'Anime' ";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MovieModel movie = new MovieModel();
                movie.setMovieID(rs.getInt("Movie_ID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setType(rs.getString("Type"));
                movie.setReleaseYear(rs.getInt("Release_Year"));
                movie.setThumbnail(rs.getString("Thumbnail"));
                movie.setVideo(rs.getString("Video"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }
	 /**
		 * Retrieves all movie information from the database.
		 * 
		 * @return A list of MovieModel objects containing student data. Returns null
		 *         if there is a connection error or if an exception occurs during query
		 *         execution.
		 */
	    
	
	public List<MovieModel> searchMovies(String search){
		 List<MovieModel> movies = new ArrayList<>();
		    String sql = "SELECT * FROM movie WHERE Title LIKE ?";
		    try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
		        stmt.setString(1, "%" + search + "%");

		        try (ResultSet rs = stmt.executeQuery()) {
		            while (rs.next()) {
		                MovieModel movie = new MovieModel();
		                movie.setMovieID(rs.getInt("Movie_ID"));
		                movie.setTitle(rs.getString("Title"));
		                movie.setGenre(rs.getString("Genre"));
		                movie.setType(rs.getString("Type"));
		                movie.setReleaseYear(rs.getInt("Release_Year"));
		                movie.setThumbnail(rs.getString("Thumbnail"));
		                movie.setVideo(rs.getString("Video"));
		                movies.add(movie);
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		}
	return movies;

	}
	
	public List<MovieModel> getMoviesFiltered(String genre, String year) {
	    List<MovieModel> list = new ArrayList<>();
	    StringBuilder query = new StringBuilder("SELECT * FROM movie WHERE 1=1");
	    
	    if (genre != null && !genre.isEmpty()) {
	        query.append(" AND Genre = ?");
	    }
	    if (year != null && !year.isEmpty()) {
	        query.append(" AND Release_Year = ?");
	    }

	    try (
	         PreparedStatement stmt = dbConn.prepareStatement(query.toString())) {
	        
	        int index = 1;
	        if (genre != null && !genre.isEmpty()) {
	            stmt.setString(index++, genre);
	        }
	        if (year != null && !year.isEmpty()) {
	            stmt.setString(index++, year);
	        }

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            MovieModel movie = new MovieModel();
	            movie.setMovieID(rs.getInt("Movie_ID"));
	            movie.setTitle(rs.getString("Title"));
	            movie.setGenre(rs.getString("Genre"));
	            movie.setReleaseYear(rs.getInt("Release_Year"));
	            movie.setThumbnail(rs.getString("Thumbnail"));
	            movie.setVideo(rs.getString("Video"));
	            list.add(movie);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	 /**
		 * Retrieves all user information from the database.
		 * 
		 * @return A list of MovieModel objects containing student data. Returns null
		 *         if there is a connection error or if an exception occurs during query
		 *         execution.
		 */
	    
	
	public List<MovieModel> getAnimeFiltered(String genre, String year) {
	    List<MovieModel> list = new ArrayList<>();
	    StringBuilder query = new StringBuilder("SELECT * FROM movie WHERE 1=1 AND Type = 'Anime' ");
	    
	    if (genre != null && !genre.isEmpty()) {
	        query.append(" AND Genre = ?");
	    }
	    if (year != null && !year.isEmpty()) {
	        query.append(" AND Release_Year = ?");
	    }

	    try (
	         PreparedStatement stmt = dbConn.prepareStatement(query.toString())) {
	        
	        int index = 1;
	        if (genre != null && !genre.isEmpty()) {
	            stmt.setString(index++, genre);
	        }
	        if (year != null && !year.isEmpty()) {
	            stmt.setString(index++, year);
	        }

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            MovieModel movie = new MovieModel();
	            movie.setMovieID(rs.getInt("Movie_ID"));
	            movie.setTitle(rs.getString("Title"));
	            movie.setGenre(rs.getString("Genre"));
	            movie.setReleaseYear(rs.getInt("Release_Year"));
	            movie.setThumbnail(rs.getString("Thumbnail"));
	            movie.setVideo(rs.getString("Video"));
	            list.add(movie);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	 /**
		 * Retrieves all movie information with genre from the database.
		 * 
		 * @return A list of MovieModel objects containing student data. Returns null
		 *         if there is a connection error or if an exception occurs during query
		 *         execution.
		 */
	    
	
	public List<MovieModel> getMovieFiltered(String genre, String year) {
	    List<MovieModel> list = new ArrayList<>();
	    StringBuilder query = new StringBuilder("SELECT * FROM movie WHERE 1=1 AND Type = 'Movie' ");
	    
	    if (genre != null && !genre.isEmpty()) {
	        query.append(" AND Genre = ?");
	    }
	    if (year != null && !year.isEmpty()) {
	        query.append(" AND Release_Year = ?");
	    }

	    try (
	         PreparedStatement stmt = dbConn.prepareStatement(query.toString())) {
	        
	        int index = 1;
	        if (genre != null && !genre.isEmpty()) {
	            stmt.setString(index++, genre);
	        }
	        if (year != null && !year.isEmpty()) {
	            stmt.setString(index++, year);
	        }

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            MovieModel movie = new MovieModel();
	            movie.setMovieID(rs.getInt("Movie_ID"));
	            movie.setTitle(rs.getString("Title"));
	            movie.setGenre(rs.getString("Genre"));
	            movie.setReleaseYear(rs.getInt("Release_Year"));
	            movie.setThumbnail(rs.getString("Thumbnail"));
	            movie.setVideo(rs.getString("Video"));
	            list.add(movie);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	 /**
		 * Retrieves all movie information from the database.
		 * 
		 * @return A list of MovieModel objects containing student data. Returns null
		 *         if there is a connection error or if an exception occurs during query
		 *         execution.
		 */
	    
	
	public List<MovieModel> getSeriesFiltered(String genre, String year) {
	    List<MovieModel> list = new ArrayList<>();
	    StringBuilder query = new StringBuilder("SELECT * FROM movie WHERE 1=1 AND Type = 'Series' ");
	    
	    if (genre != null && !genre.isEmpty()) {
	        query.append(" AND Genre = ?");
	    }
	    if (year != null && !year.isEmpty()) {
	        query.append(" AND Release_Year = ?");
	    }

	    try (
	         PreparedStatement stmt = dbConn.prepareStatement(query.toString())) {
	        
	        int index = 1;
	        if (genre != null && !genre.isEmpty()) {
	            stmt.setString(index++, genre);
	        }
	        if (year != null && !year.isEmpty()) {
	            stmt.setString(index++, year);
	        }

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            MovieModel movie = new MovieModel();
	            movie.setMovieID(rs.getInt("Movie_ID"));
	            movie.setTitle(rs.getString("Title"));
	            movie.setGenre(rs.getString("Genre"));
	            movie.setReleaseYear(rs.getInt("Release_Year"));
	            movie.setThumbnail(rs.getString("Thumbnail"));
	            movie.setVideo(rs.getString("Video"));
	            list.add(movie);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
}

package com.movieheram.service;

import java.sql.Connection;   
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.movieheram.config.DbConfig;
import com.movieheram.model.MembershipModel;
import com.movieheram.model.MovieModel;
import com.movieheram.model.UserModel;
import com.movieheram.util.ImageUtil;
import com.movieheram.util.VideoUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

/**
 * Service class for interacting with the database to retrieve dashboard-related
 * data. This class handles database connections and performs queries to fetch
 * student information.
 */

public class DashboardService{
	
	private static Connection dbConn;
    private boolean isConnectionError = false;
    
    /**
	 * Constructor that initializes the database connection. Sets the connection
	 * error flag if the connection fails.
	 */

    public DashboardService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }
    /**
	 * Counts all user from the database.
	 * 
	 * @return A total count of users
	 */
    
    public int getUserCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM user WHERE Is_Admin = 0"; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    /**
	 * Counts all contents uploaded from the database.
	 * 
	 * @return A total count of uploaded count.
	 */
    
    public int getAllMovieCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM movie"; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    /**
	 * Counts all movie type count from the database.
	 * 
	 * @return A total count of movie type.
	 */

    public int getMovieCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM movie WHERE Type = 'Movie' "; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    /**
	 * Counts all series type count from the database.
	 * 
	 * @return A total count of series type.
	 */

    public int getSeriesCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM movie WHERE Type = 'Series' "; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    /**
	 * Counts all anime type count from the database.
	 * 
	 * @return A total count of anime type.
	 */

    
    public int getAnimeCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM movie WHERE Type = 'Anime' "; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    /**
	 * Counts all standard membership count from the database.
	 * 
	 * @return A total count of standard membership.
	 */

    public int getStandardCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM user WHERE Membership_ID = '3' "; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    /**
	 * Counts all premium membership count from the database.
	 * 
	 * @return A total count of premium membership.
	 */

    public int getPremiumCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM user WHERE Membership_ID = '2' "; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    /**
   	 * Counts all premium plus membership count from the database.
   	 * 
   	 * @return A total count of premium plus membership.
   	 */
    public int getPremiumPlusCount() {
        if (isConnectionError) return -1;
        String sql = "SELECT COUNT(*) FROM user WHERE Membership_ID = '1' "; 
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    /**
	 * Retrieves all user information from the database.
	 * 
	 * @return A list of UserModel objects containing student data. Returns null
	 *         if there is a connection error or if an exception occurs during query
	 *         execution.
	 */
    
    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT u.User_ID, u.Name, u.Email, u.Image, u.Created_Date, m.Membership_Type AS Membership_Type " +
                     "FROM user u LEFT JOIN membership m ON u.Membership_ID = m.Membership_ID WHERE u.Is_Admin = 0";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
        	FavoriteService favoriteService = new FavoriteService();

            while (rs.next()) {
                UserModel user = new UserModel();
                user.setId(rs.getInt("User_ID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setImageUrl(rs.getString("Image"));
                user.setCreatedDate(rs.getDate("Created_Date"));

                // Wrap the membership_type string into a MembershipModel
                String membershipType = rs.getString("Membership_Type");
                if (membershipType != null) {
                    MembershipModel membership = new MembershipModel();
                    membership.setMembershipType(membershipType);
                    user.setMembership(membership);
                }
                user.setFavoriteMovies(favoriteService.getFavoriteMovies(user.getId()));

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    
    /**
	 * Deletes selected user information from the database.
	 * 
	 */
    
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM user WHERE User_ID = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /**
	 * Adds movie to the database.
	 *
	 */
    
    public static boolean addMovie(HttpServletRequest request) {
        boolean success = false;

        try {
            // Get form inputs
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            String type = request.getParameter("type");
            int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));

            // Get uploaded files
            Part thumbnailPart = request.getPart("thumbnailFile");
            String thumbnailUrl = request.getParameter("thumbnailUrl");
            Part videoPart = request.getPart("video");
            String thumbnail = "default.png";

            // Save files to resources/images/movie
            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                thumbnail = new ImageUtil().uploadImage(thumbnailPart, "movie");
            } else if (thumbnailUrl != null && !thumbnailUrl.trim().isEmpty()) {
                thumbnail = thumbnailUrl.trim();
            }

            String video = VideoUtil.saveFile(videoPart); 

            // Insert into database
            String sql = "INSERT INTO movie (Title, Genre, Type, Release_Year, Thumbnail, Video) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {

                stmt.setString(1, title);
                stmt.setString(2, genre);
                stmt.setString(3, type);
                stmt.setInt(4, releaseYear);
                stmt.setString(5, thumbnail);
                stmt.setString(6, video);

                success = stmt.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
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
    
    /**
	 * Retrieves movie information from the database with specific id.
	 * 
	 * @return A MovieModel objects containing student data. Returns null
	 *         if there is a connection error or if an exception occurs during query
	 *         execution.
	 */
    
    public MovieModel getMovieById(int movieId) {
        MovieModel movie = null;
        String sql = "SELECT * FROM movie WHERE Movie_ID = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, movieId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                movie = new MovieModel();
                movie.setMovieID(rs.getInt("Movie_ID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setType(rs.getString("Type"));
                movie.setReleaseYear(rs.getInt("Release_Year"));
                movie.setThumbnail(rs.getString("Thumbnail"));
                movie.setVideo(rs.getString("Video"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }
    
    /**
	 * Updates movie information to the database.
	 * 
	 */
    
    public boolean updateMovie(MovieModel movie) {
        String sql = "UPDATE movie SET Title=?, Genre=?, Type=?, Release_Year=?, Thumbnail=?, Video=? WHERE Movie_ID=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, movie.getTitle());
            stmt.setString(2, movie.getGenre());
            stmt.setString(3, movie.getType());
            stmt.setInt(4, movie.getReleaseYear());
            stmt.setString(5, movie.getThumbnail());
            stmt.setString(6, movie.getVideo());
            stmt.setInt(7, movie.getMovieID());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /**
	 * Deletes selected movie from the database.
	 * 
	 */
    
    public boolean deleteMovie(int movieId) {
        String sql = "DELETE FROM movie WHERE Movie_ID = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, movieId);
            return stmt.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public UserModel getUserById(int userId) {
        String sql = "SELECT u.User_ID, u.Name, u.Email, u.Image, u.Created_Date, m.Membership_Type AS Membership_Type " +
                     "FROM user u LEFT JOIN membership m ON u.Membership_ID = m.Membership_ID WHERE u.User_ID = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setId(rs.getInt("User_ID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setImageUrl(rs.getString("Image"));
                user.setCreatedDate(rs.getDate("Created_Date"));
                
                String membershipType = rs.getString("Membership_Type");
                if (membershipType != null) {
                    MembershipModel membership = new MembershipModel();
                    membership.setMembershipType(membershipType);
                    user.setMembership(membership);
                }
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}

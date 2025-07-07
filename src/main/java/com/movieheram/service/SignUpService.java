package com.movieheram.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.movieheram.config.DbConfig;
import com.movieheram.model.MembershipModel;
import com.movieheram.model.UserModel;

/**
 * SignUpService handles the registration of new users. It manages database
 * interactions for user registration.
 */

public class SignUpService {
	
	private Connection dbConn;
	private boolean isConnectionError = false;
	
	/**
	 * Constructor that initializes the database connection. Sets the connection
	 * error flag if the connection fails.
	 */
	
	public SignUpService() {
		
		try {
	        dbConn = DbConfig.getDbConnection();
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	        isConnectionError = true;
	    }

	}
	/**
	 * Registers a new user in the database.
	 *
	 * @param userModel the user details to be registered
	 * @return Boolean indicating the success of the operation
	 * @throws ClassNotFoundException 
	 */

	public Integer addUser(UserModel userModel) throws ClassNotFoundException {
		String insertQuery = "INSERT INTO user (Name, Email, Password, Image, Is_Admin, Membership_ID, Created_Date) "
				+ "VALUES (?,?,?,?,false,NULL,CURDATE())";
		
		try ( 	PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
			
						// Insert user details
						insertStmt.setString(1, userModel.getName());
						insertStmt.setString(2, userModel.getEmail());
						insertStmt.setString(3, userModel.getPassword());
						insertStmt.setString(4, userModel.getImageUrl());
						
				        int affectedRows = insertStmt.executeUpdate();

				        if (affectedRows > 0) {
				            ResultSet generatedKeys = insertStmt.getGeneratedKeys();
				            if (generatedKeys.next()) {
				                return generatedKeys.getInt(1); 
				            }
				        }
		}catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean updateMembership(int userId, int membershipId) {
	    String sql = "UPDATE user SET Membership_ID = ? WHERE User_ID = ?";
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, membershipId);
	        stmt.setInt(2, userId);
	        return stmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public UserModel getUserById(int userId) {
	    String sql = "SELECT u.User_ID, u.Name, u.Email, u.Image, m.Membership_ID, m.Membership_Type, u.Created_Date FROM user u LEFT JOIN membership m ON u.Membership_ID = m.Membership_ID WHERE u.User_ID = ?";
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            UserModel user = new UserModel();
	            user.setId(rs.getInt("User_ID"));
	            user.setName(rs.getString("Name"));
	            user.setEmail(rs.getString("Email"));
	            user.setImageUrl(rs.getString("Image"));

	            MembershipModel membership = new MembershipModel();
	            membership.setMembershipId(rs.getInt("Membership_ID"));
	            membership.setMembershipType(rs.getString("Membership_Type"));
	            user.setCreatedDate(rs.getDate("Created_Date")); 

	            user.setMembership(membership);
	            return user;
	          
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public boolean emailExists(String email) {
	    String sql = "SELECT 1 FROM user WHERE Email = ?";
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, email);
	        ResultSet rs = stmt.executeQuery();
	        return rs.next(); // true if email found
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false; // safe default
	    }
	}
}
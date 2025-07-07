package com.movieheram.service;

import java.sql.Connection;  

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

import com.movieheram.config.DbConfig;
import com.movieheram.model.UserModel;
import com.movieheram.util.PasswordUtil;

/**
 * Service class for handling login operations.
 * Connects to the database, verifies user credentials, and returns login status.
 */
public class LoginService {

    private Connection dbConn;
    private boolean isConnectionError = false;
    
    /**
	 * Constructor that initializes the database connection. Sets the connection
	 * error flag if the connection fails.
	 */
    
    public LoginService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Validates the user credentials against the database records using email.
     *
     * @param email    user's email
     * @param password user's plain text password
     * @return UserModel if login successful, null otherwise
     */
    public Boolean loginUser(UserModel userModel) {
        if (isConnectionError) {
            System.out.println("Database connection error!");
            return null;
        }

        String query = "SELECT * FROM user WHERE Email = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getEmail());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	 // Check password and set user model
                boolean isValid = validatePassword(rs, userModel);
                if (isValid) {
                    // Set additional fields (like is_admin) in the user model
                    userModel.setId(rs.getInt("User_ID"));
                    userModel.setName(rs.getString("Name"));
                    userModel.setImageUrl(rs.getString("Image"));
                    userModel.setIs_admin(rs.getBoolean("Is_Admin")); 
                    userModel.setCreatedDate(rs.getDate("Created_Date"));
                    return true;
                }            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return false;
    }

    /**
     * Validates the password and constructs the UserModel.
     *
     * @param result   ResultSet with user data
     * @param email    entered email
     * @param password entered password
     * @return UserModel if password matches, null otherwise
     * @throws SQLException
     */
    private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
        String dbEmail = result.getString("Email");
    	String dbPassword = result.getString("Password");
        String decrypted = PasswordUtil.decrypt(dbPassword, dbEmail);
        
        return dbEmail.equals(userModel.getEmail())
                && Objects.equals(decrypted, userModel.getPassword());
    }
}
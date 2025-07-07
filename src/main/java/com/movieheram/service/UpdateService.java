package com.movieheram.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Objects;

import com.movieheram.config.DbConfig;
import com.movieheram.util.PasswordUtil;

/**
 * Service class for updating user information in the database.
 * 
 * This class provides methods to update student details and fetch program IDs
 * from the database. It manages database connections and handles SQL
 * exceptions.
 */

public class UpdateService {
	
	/**
	 * Updates user name in the database.
	 * 
	 * @param user The UserModel object containing the updated user data.
	 */
	
	public void updateName(int userId, String newName) {
        String sql = "UPDATE user SET Name = ? WHERE User_ID = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newName);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	/**
	 * Updates user image in the database.
	 * 
	 * @param user The UserModel object containing the updated user data.
	 */

	public void updateImage(int userId, String imageUrl) {
        String sql = "UPDATE user SET Image = ? WHERE User_ID = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, imageUrl);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	/**
	 * Updates password in the database.
	 * 
	 * @param user The UserModel object containing the updated user data.
	 */

	public boolean changePassword(String email, String currentPassword, String newPassword) {
	    try (Connection conn = DbConfig.getDbConnection()) {
	        String fetch = "SELECT Email, Password FROM user WHERE Email = ?";
	        PreparedStatement stmt = conn.prepareStatement(fetch);
	        stmt.setString(1, email);
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            String dbEmail = result.getString("Email");
	            String dbPassword = result.getString("Password");
	            String decrypted = PasswordUtil.decrypt(dbPassword, dbEmail); // Decrypt with email salt

	            if (dbEmail.equals(email) && Objects.equals(decrypted, currentPassword)) {
	                // Password matches, now update
	                String newEncrypted = PasswordUtil.encrypt(email, newPassword);
	                String update = "UPDATE user SET Password = ? WHERE Email = ?";
	                PreparedStatement updateStmt = conn.prepareStatement(update);
	                updateStmt.setString(1, newEncrypted);
	                updateStmt.setString(2, email);
	                return updateStmt.executeUpdate() > 0;
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
}
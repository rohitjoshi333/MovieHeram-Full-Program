package com.movieheram.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

/**
 * Utility class for handling video file uploads in the MovieHeram application.
 */

public class VideoUtil {
	/**
     * Saves an uploaded movie video to the server's "resources/video" directory.
     * This method is typically used within a servlet context to determine the real path dynamically.
     *
     * @param videoPart the video file uploaded as a Part object
     * @param request   the HttpServletRequest to get the application context path
     * @return the saved file name if successful, otherwise null
     */
	    public static String saveMovieVideo(Part videoPart, HttpServletRequest request) {
	        String fileName = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();
	        String uploadPath = request.getServletContext().getRealPath("") + File.separator + "resources/video";

	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) uploadDir.mkdirs();

	        try (InputStream input = videoPart.getInputStream()) {
	            Files.copy(input, new File(uploadPath + File.separator + fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return fileName;
	    }
	    
	    /**
	     * Saves an uploaded video file to a hardcoded path in the local file system.
	     * This method is useful for local development without relying on servlet context paths.
	     *
	     * @param videoPart the video file uploaded as a Part object
	     * @return the saved file name if successful, otherwise null
	     */
	    
		public static String saveFile(Part videoPart) {
			    String fileName = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();
			    String uploadPath = "/Users/rohitjoshi/Desktop/app/movieheram/src/main/webapp/resources/video";

			    File uploadDir = new File(uploadPath);
			    if (!uploadDir.exists()) uploadDir.mkdirs();

			    try (InputStream input = videoPart.getInputStream()) {
			        Files.copy(input, new File(uploadPath + File.separator + fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
			    } catch (IOException e) {
			        e.printStackTrace();
			    }

			    return fileName;
			}
		}



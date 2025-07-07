package com.movieheram.util;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.Part;

/**
 * Utility class for handling image file uploads.
 * <p>
 * This class provides methods for extracting the file name from a {@link Part}
 * object and uploading the image file to a specified directory on the server.
 * </p>
 */
	
public class ImageUtil {

    /**
     * Extracts the image file name from the Part header.
     */
    public String getImageNameFromPart(Part part, String defaultFileName) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");

        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                if (imageName != null && !imageName.trim().isEmpty()) {
                    return imageName;
                }
            }
        }

        return defaultFileName; // Fallback if filename is not found
    }
    /**
	 * Uploads the image file from the given {@link Part} object to a specified
	 * directory on the server.
	 * 
	 * <p>
	 * This method ensures that the directory where the file will be saved exists
	 * and creates it if necessary. It writes the uploaded file to the server's file
	 * system. Returns {@code true} if the upload is successful, and {@code false}
	 * otherwise.
	 * </p>
	 * If not found, assigns a default filename based on context.
	 * @param part the {@link Part} object representing the uploaded image file.
	 * @return {@code true} if the file was successfully uploaded, {@code false}
	 *         otherwise.
	 */
    
    public String uploadImage(Part part, String saveFolder) {
        String baseDir = "/Users/rohitjoshi/Desktop/app/movieheram/src/main/webapp/resources/images";
        String savePath = baseDir + saveFolder + File.separator;

        File dir = new File(savePath);
        if (!dir.exists() && !dir.mkdirs()) {
            System.err.println("Failed to create directory: " + savePath);
            return null;
        }

        try {
            String imageName = getImageNameFromPart(part, "default.png");
            String fullPath = savePath + imageName;
            part.write(fullPath);

            return imageName;

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}


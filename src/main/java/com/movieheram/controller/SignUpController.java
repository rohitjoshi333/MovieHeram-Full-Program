package com.movieheram.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.movieheram.model.UserModel;
import com.movieheram.service.SignUpService;
import com.movieheram.util.ImageUtil;
import com.movieheram.util.PasswordUtil;
import com.movieheram.util.SessionUtil;
import com.movieheram.util.ValidationUtil;

/**
 * SignUpController handles user registration requests and processes form
 * submissions. It also manages file uploads and account creation. 
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/signUp"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
				maxFileSize = 1024 * 1024 * 10, // 10MB
				maxRequestSize = 1024 * 1024 * 50) // 50MB

public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private final ImageUtil imageUtil = new ImageUtil();
	private final SignUpService signUpService = new SignUpService();
	 private static final String default_profile = "${pageContext.request.contextPath}/resources/images/user/default.png";
	 
	 /**
		 * Handles GET requests to the signup page.
		 *
		 * @param request  HttpServletRequest object
		 * @param response HttpServletResponse object
		 * @throws ServletException if a servlet-specific error occurs
		 * @throws IOException      if an I/O error occurs
		 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
	}
	/**
	 * Handles POST requests to the signup page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Validate and extract user model
			String validationMessage = validateRegistrationForm(request);
			if (validationMessage != null) {
				handleError(request, response, validationMessage);
				return;
			}
			
			 String email = request.getParameter("email");

		        if (signUpService.emailExists(email)) {
		            handleError(request, response, "Email is already registered. Try logging in or use a different email.");
		            return;
		        }

			UserModel userModel = extractUserModel(request);
			Integer userId = signUpService.addUser(userModel);

			if (userId == null) {
				handleError(request, response, "Our server is under maintenance. Please try again later!");
			} else {
				 // Store userId in session for membership step
                SessionUtil.setRegisteredUserId(request, userId);
			}
			 // Upload image only if present
            Part image = request.getPart("imageUrl");
            if (image != null && image.getSize() > 0) {
            	String rootPath = getServletContext().getRealPath("/");
                imageUtil.uploadImage(image, "user");   
                } else {
                    // No image uploaded, set the default image name
                    userModel.setImageUrl(default_profile);}
            // Redirect to membership plan page
            response.sendRedirect("membership");
            return;
            
		} catch (Exception e) {
			handleError(request, response, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
			
	}

	
	private String validateRegistrationForm(HttpServletRequest req) {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("retypePassword");
		
		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(name))
			return "Name is required.";
		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";
		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";
		if (ValidationUtil.isNullOrEmpty(retypePassword))
			return "Please retype the password.";


		// Validate fields

		if (!ValidationUtil.isValidPassword(password))
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		if (!ValidationUtil.doPasswordsMatch(password, retypePassword))
			return "Passwords do not match.";


		return null; // All validations passed
	}
	
	private UserModel extractUserModel(HttpServletRequest req) throws Exception {
		String name = req.getParameter("name");
		String email = req.getParameter("email");

		String password =  PasswordUtil.encrypt(email, req.getParameter("password"));
		Part image = req.getPart("imageUrl");
		String imageUrl = (image != null && image.getSize() > 0)
                ? imageUtil.getImageNameFromPart(image,"user")
                		:null;

        // No membership yet
        return new UserModel(name, email, password, imageUrl, null);
	}

		
	
	private void handleError(HttpServletRequest request, HttpServletResponse response, String message)
			throws ServletException, IOException {
		request.setAttribute("error", message);
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("email", request.getParameter("email"));
		request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
	}
}
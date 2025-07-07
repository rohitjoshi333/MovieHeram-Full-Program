package com.movieheram.controller;

import java.io.IOException;

import com.movieheram.model.UserModel;
import com.movieheram.service.LoginService;
import com.movieheram.service.SignUpService;
import com.movieheram.util.CookieUtil;
import com.movieheram.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final LoginService loginService;

	/**
	 * Constructor initializes the LoginService.
	 */
	public LoginController() {
		this.loginService = new LoginService();
	}

	/**
	 * Handles GET requests to the login page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

        UserModel userModel = new UserModel(email, password);
		Boolean loginStatus = loginService.loginUser(userModel);
		
		if (loginStatus != null && loginStatus) {
			SignUpService signUpService = new SignUpService(); 
		    UserModel fullUser = signUpService.getUserById(userModel.getId()); 

		   
            // Store full user object in session
            SessionUtil.setAttribute(req, "user", fullUser);
            String role = userModel.getIs_admin() != null && userModel.getIs_admin() ? "admin" : "user";
            CookieUtil.addCookie(resp, "role", role, 5 * 60);

         // Redirect based on role
            if ("admin".equalsIgnoreCase(role)) {
                resp.sendRedirect(req.getContextPath() + "/dashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
        	// Failed login
            handleLoginFailure(req, resp, false); // false = invalid credentials
        }
    }
	

	/**
	 * Handles login failures by setting attributes and forwarding to the login
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 * @param resp        HttpServletResponse object
	 * @param loginStatus Boolean indicating the login status
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "Invalid Email or Password. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}

}
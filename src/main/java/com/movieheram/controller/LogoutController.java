package com.movieheram.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.movieheram.util.CookieUtil;
import com.movieheram.util.SessionUtil;
/**
 * LogoutController is responsible for handling log out. Redirects user to getStarted page.
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
	 * Handles GET requests to the login page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        handleLogout(request, response);
    }

	 /**
		 * Handles POST requests for user logout.
		 *
		 * @param request  HttpServletRequest object
		 * @param response HttpServletResponse object
		 * @throws ServletException if a servlet-specific error occurs
		 * @throws IOException      if an I/O error occurs
		 */
	 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        handleLogout(request, response);
    }
	 /**
		 * Handles logout by setting attributes and forwarding to the get started
		 * page.
		 *
		 * @param req         HttpServletRequest object
		 * @param resp        HttpServletResponse object
		 * @param loginStatus Boolean indicating the login status
		 * @throws ServletException if a servlet-specific error occurs
		 * @throws IOException      if an I/O error occurs
		 */
    private void handleLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        CookieUtil.deleteCookie(response, "role");
        SessionUtil.invalidateSession(request);
        response.sendRedirect(request.getContextPath() + "/getStarted");
    }
}
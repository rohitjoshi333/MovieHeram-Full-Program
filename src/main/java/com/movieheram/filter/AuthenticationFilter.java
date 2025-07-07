package com.movieheram.filter;

import java.io.IOException; 
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.movieheram.model.UserModel;
import com.movieheram.util.CookieUtil;
import com.movieheram.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    private static final String[] PUBLIC_PAGES = {
            "/login", "/signUp", "/getStarted", "/termsCondition", "/about", "/membership", "/profile", "/updateProfile", "/changePassword","/favorite"
    };

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
       

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        if (uri.contains("/resources/") || uri.endsWith(".css") || uri.endsWith(".js") ||
            uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".jpeg") ||
            uri.endsWith(".webp") || uri.endsWith(".mp4")) {
            chain.doFilter(request, response);
            return;
        }


        for (String page : PUBLIC_PAGES) {
            if (uri.equals(contextPath + page) || uri.equals(contextPath + page + "/")) {
                chain.doFilter(request, response);
                return;
            }
        }
        
        // Check login status first
        UserModel user = (UserModel) SessionUtil.getAttribute(req, "user");
        boolean isLoggedIn = user != null;

        if (!isLoggedIn) {
            res.sendRedirect(contextPath + "/getStarted");
            return;
        }

        // Checks role-based access
        String role = CookieUtil.getCookie(req, "role") != null ? CookieUtil.getCookie(req, "role").getValue() : null;
        boolean isAdmin = "admin".equalsIgnoreCase(role);
        boolean isAllowed = false; // Flag to track if the user is allowed to proceed

        if (isAdmin) {
            // Admin trying to access user-only pages
            if (uri.startsWith(contextPath + "/home") ||
                uri.startsWith(contextPath + "/profile") ||
                uri.startsWith(contextPath + "/favorite") ||
                uri.startsWith(contextPath + "/movie") ||
                uri.startsWith(contextPath + "/series") ||
                uri.startsWith(contextPath + "/cartoon") ||
                uri.startsWith(contextPath + "/termsCondition") ||
                uri.startsWith(contextPath + "/about")) {
                res.sendRedirect(contextPath + "/dashboard");
                return;
            }
            // Allow access to admin pages
            if (uri.startsWith(contextPath + "/dashboard") ||
                uri.startsWith(contextPath + "/deleteUser") ||
            	uri.startsWith(contextPath + "/logout") ||
            	uri.contains("/admin")) {
                isAllowed = true;
            } else {
                // If an admin tries to access any other page not explicitly allowed, redirect to dashboard
                res.sendRedirect(contextPath + "/dashboard");
                return;
            }

        } else { // Normal user
            // User trying to access admin-only pages
            if (uri.startsWith(contextPath + "/dashboard") || uri.contains("/admin")) {
                res.sendRedirect(contextPath + "/home");
                return;
            }
            // Allow access to user pages
            if (uri.startsWith(contextPath + "/home") ||
                uri.startsWith(contextPath + "/profile") ||
                uri.startsWith(contextPath + "/favorite") ||
                uri.startsWith(contextPath + "/logout") ||
                uri.startsWith(contextPath + "/movie") ||
                uri.startsWith(contextPath + "/series") ||
                uri.startsWith(contextPath + "/cartoon") ||
                uri.startsWith(contextPath + "/termsCondition") ||
                uri.startsWith(contextPath + "/about")) {
                isAllowed = true;
            } else {
                // If a user tries to access any other page not explicitly allowed, redirect to home
                res.sendRedirect(contextPath + "/home");
                return;
            }
        }

        if (isAllowed) {
            chain.doFilter(request, response);
            }
        }
    

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    
    }

    @Override
    public void destroy() {
    	// Cleanup logic, if required
    }
}
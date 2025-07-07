<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movieहेरम - Enjoy on your TV</title>
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/user.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
    
</head>
<body style="opacity: 0; animation: fadeIn 2s ease-in-out forwards; background-color: rgb(0, 0, 0);">

    <div id="back-to-top" class="back-to-top">
        <i class="fas fa-arrow-up"></i>
        
    </div>  
    
    <div class="auth-container">
        <div class="auth-box">
            <div class="logo">Movieहेरम</div>
            <h2>Welcome Back</h2>
            <c:if test="${not empty error}">
			    <div class="error-message" style="color:red; margin-bottom:10px;">
			        ${error}
			    </div>
			</c:if>
            <form action="login" method="POST">
                <div class="form-group">
                    <input type="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn-primary"><span>Continue to Watch</span></button>
            </form>
            <p class="switch-prompt">
                First time here? <a href="signUp">Create your account</a>
            </p>
        </div>
    </div>

     <div class="separation"></div>

    <section class="first">
        <div>
            <span>Enjoy on your TV</span>
            <span>Watch on smart TVs, PlayStation, Xbox, Chromecast, Apple TV, Blu-ray players and more.</span>
        </div>

        <div class="secImg">
            <img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/tv.png" alt="">
            <video src="${pageContext.request.contextPath}/resources/video/LoginTrailer.mp4"
                autoplay loop muted></video>
        </div>
    </section>
    <div class="separation"></div>

    <section class="first second">

        <div class="secImg">
            <img src="${pageContext.request.contextPath}/resources/images/system/nun.jpg" alt="Nun" />
        </div>
        <div>
            <span>Download your shows to watch offline</span>
            <span>Save your favorites easily and always have something to watch.</span>
        </div>
    </section>
    <div class="separation"></div>
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Movieहेरम</h3>
                <p>Your ultimate streaming destination</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <a href="about">About Us</a>
                <a href="https://help.netflix.com/en">Contact</a>
                <a href="termsCondition">Terms of Service</a>
            </div>
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <div class="social-links">
                    <a href="https://www.facebook.com/login.php/">Facebook</a>
                    <a href="https://x.com/i/flow/login">Twitter</a>
                    <a href="https://www.instagram.com/accounts/login/?hl=en">Instagram</a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Movieहेरम. All rights reserved.</p>
        </div>
    </footer>

    <!-- JavaScript -->
     <script src="${pageContext.request.contextPath}/javascript/main.js"></script>

</body>
</html>

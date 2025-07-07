<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movieहेरम - Join Now</title>
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/user.css" />
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
    <div class="auth-container">
        <div class="auth-box">
            <div class="logo">Movieहेरम</div>
            <h2>Join the Vibe</h2>
            <c:if test="${not empty error}">
			    <div class="error-message" style="color:red; margin-bottom:10px;">
			        ${error}
			    </div>
			</c:if>
            <form action="signUp" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="name" value="${name}" placeholder="What should we call you?" required>
                </div>
                <div class="form-group">
                    <input type="email" name="email" value="${email}" placeholder="Your email address" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Create a password" required>
                </div>
               <div class="form-group">
                    <input type="password" name="retypePassword" placeholder=" Retype password" required>
                </div>
               
                <div class="form-group">
                    <label for="profile-image" class="file-upload">
                        <img src="${pageContext.request.contextPath}/resources/images/user/${user.imageUrl}" alt="Profile Image" style="width: 120px;" hidden>
                        <span>Choose your avatar</span>
                        <input type="file" name="imageUrl" id="profile-image" accept="image/*">
                    </label>
                </div>
                <button type="submit" class="btn-primary"><span>Choose Your Plan</span></button>
            </form>
            <p class="switch-prompt">
                Already vibing with us? <a href="login">Sign in</a>
            </p>
        </div>
    </div>
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
    <script>
        function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
    	document.getElementById("profile-image").addEventListener("change", function() {
	        const fileLabel = this.previousElementSibling;
	        const fileName = this.files[0]?.name || "Choose Avatar";
	        fileLabel.textContent = fileName;
   	 });

</script>
</body>
</html>
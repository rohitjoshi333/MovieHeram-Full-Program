<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.movieheram.model.UserModel" %>
<%@ page import="java.sql.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }

   
    java.sql.Date createdDate = (java.sql.Date) user.getCreatedDate();
    java.time.LocalDate createdLocalDate = createdDate.toLocalDate();
    String nextMonth = createdLocalDate.plusMonths(1)
        .format(java.time.format.DateTimeFormatter.ofPattern("MMMM d, yyyy"));
%>   

<!DOCTYPE html>
<html>
<head>
    <title>Movieहेरम-Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user.css" />
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
<div id="back-to-top" class="back-to-top">
    <i class="fas fa-arrow-up"></i>
</div>
<body style="opacity: 0; animation: fadeIn 1s ease-in-out forwards;">
    <div class="profile-container">
        <nav class="navbar">
            <div class="logo">Movieहेरम</div>
            <div style="display: flex; gap: 20px;">

                <a href="home" class="btn-primary"> <span> Home </span> </a>
                <a href="login" class="btn-primary"> <span> Logout </span> </a>
            </div>
        </nav>

        <div class="profile-content">
            <h2>Welcome back, <%= user.getName() %>!</h2>

            <div class="dashboard">
                <div class="stat-card">
                    <h3>Next Payment</h3>
                    <p><%= nextMonth %></p>
                </div>
                <div class="stat-card">
                    <h3>Current Plan</h3>
                    <p><%= user.getMembership() != null ? user.getMembership().getMembershipType() : "No Plan" %></p>
                </div>
            </div>

            <div class="profile-box" style="margin-top: 30px;">
                <!-- Update Profile Form -->
                <form action="updateProfile" method="POST" enctype="multipart/form-data">
                    <div class="profile-image" style="display: flex; align-items: center; gap: 400px;">
						<c:choose>
						    <c:when test="${not empty user.imageUrl}">
						        <img src="${pageContext.request.contextPath}/resources/images/user/${user.imageUrl}" 
						             alt="Profile Image" style="width: 120px; height: 100%; border-radius: 50%; object-fit: cover;">
						    </c:when>
						    <c:otherwise>
						        <img src="${pageContext.request.contextPath}/resources/images/user/default.png" 
						             alt="Default Profile">
						    </c:otherwise>
						</c:choose>                        <label for="newImage" class="file-upload">
                            <span>Change Avatar</span>
                            <input type="file" name="newImage" id="newImage" accept="image/*">
                        </label>
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="newName" value="<%= user.getName() %>" required>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" value="<%= user.getEmail() %>" readonly>
                    </div>


                    <button type="submit" class="btn-primary"> <span> Update Profile </span> </button>

                </form>

                <!-- Change Password Form -->
                <form action="changePassword" method="POST" style="margin-top: 30px;">
                <c:if test="${not empty error}">
			    <div class="error-message" style="color:red; margin-bottom:10px;">
			        ${error}
			    </div>
				</c:if>
				<c:if test="${not empty message}">
			    <div class="success-message" style="color:white; margin-bottom:10px;">
			        ${message}
			    </div>
				</c:if>
          	          <div class="form-group">
                        <label>Current Password</label>
                        <input type="password" name="currentPassword" required>
                    </div>
                    <div class="form-group">
                        <label>New Password</label>
                        <input type="password" name="newPassword" required>
                    </div>

                    <button type="submit" class="btn-primary"> <span> Change Password </span> </button>
                </form>
            </div>
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
    	document.getElementById("newImage").addEventListener("change", function() {
	        const fileLabel = this.previousElementSibling;
	        const fileName = this.files[0]?.name || "Choose Avatar";
	        fileLabel.textContent = fileName;
   	 });
	</script>
    <script src="${pageContext.request.contextPath}/javascript/main.js"></script>

</body>
</html>
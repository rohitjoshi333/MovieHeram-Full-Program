<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.movieheram.model.UserModel" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Media Gallery</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fav.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
  <nav>
    <div class="logo">
      <span>
        <img src="${pageContext.request.contextPath}/resources/images/system/logo.png" alt="Logo" />
      </span>
    </div>
    <div class="nav-links" id="navLinks">
      <a href="home" class="active">Home</a>
            <a href="movie">Movies</a>
            <a href="series">Series</a>
            <a href="cartoon">Anime</a>
      <div class="search-container">
        <input type="" id="searchInput" placeholder="Search..." readonly>
      </div>
      <div class="auth-buttons">
        <div class="profile-container" id="profileContainer">
<!-- If user image is available -->
				        <c:if test="${not empty sessionScope.user.imageUrl}">
				            <img src="${pageContext.request.contextPath}/resources/images/user/${sessionScope.user.imageUrl}" 
				                 alt="Profile" class="profile-icon">
				        </c:if>
				
				        <!-- If user image is not available -->
				        <c:if test="${empty sessionScope.user.imageUrl}">
				            <img src="https://ui-avatars.com/api/?name=${sessionScope.user.name}" 
				                 alt="Profile" class="profile-icon">
				        </c:if>          <div class="profile-dropdown">
            <a href="profile">My Profile</a>
            <a href="#">My Favourites</a>
            <a href="logoutl" id="logoutBtn">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </nav>


    <section class="featured-text">
        <h1>Favorite Movies</h1>
    </section>
    <c:choose>
  <c:when test="${empty movieList}">
    <div style="text-align:left; padding: 40px;">
      <h1>No favorite movies found</h1>
    </div>
  </c:when>
  <c:otherwise>
  

      <section class="fav-cards">
      
      <c:forEach var="movie" items="${movieList}">
        <div class="media-card">
          <div class="fav-btn-fixed">
            <form action="favorite" method="post" style="display:inline;">
			  <input type="hidden" name="movieId" value="${movie.movieID}" />
			    <input type="hidden" name="redirect" value="favorite" />
			  <button type="submit" class="fav-btn" style="background: none; border: none;">
			    <i class="fa-solid fa-heart" style="color:red;"></i>
			  </button>
			</form>
          </div>
          <div class="image-wrapper">
				<c:choose>
				  <c:when test="${fn:startsWith(movie.thumbnail, 'http')}">
				    <img src="${movie.thumbnail}" alt="${movie.title}">
				  </c:when>
				  <c:otherwise>
				    <img src="${pageContext.request.contextPath}/resources/images/movie/${movie.thumbnail}" alt="${movie.title}">
				  </c:otherwise>
				</c:choose>		
				</div>
          <div class="media-info">
            <h3 class="media-title">${movie.title}</h3>
            <p class="media-meta">Genre: ${movie.genre} | Year: ${movie.releaseYear}</p>
          </div>
        </div>
      </c:forEach>
        
    </section>
  </c:otherwise>
</c:choose>
 
 

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

</body>
</html>
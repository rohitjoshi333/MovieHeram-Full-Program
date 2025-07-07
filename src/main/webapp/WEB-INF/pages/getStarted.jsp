<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movieहेरम - Enjoy on your TV</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav>
        <div class="logo">
            <span>
                <img src="${pageContext.request.contextPath}/resources/images/system/logo.png" alt="Logo" />
            </span>
          </div>

          <div class="nav-links">
            <a href="login" class="sign-in-btn">Sign In</a>
        </div>
        
    </nav>

    <!-- Loader -->
    <div id="loader">
        <div class="spinner"></div>
        <div class="loading-text">Loading...</div>
    </div>

    <div id="back-to-top" class="back-to-top">
        <i class="fas fa-arrow-up"></i>
    </div>

    <main>
        <section class="MainApp">
            <h1>Welcome To Movieहेरम 🎬</h1>
            <p style="font-size: 1.5rem;">Watch unlimited movies, Animes & series</p>
            <a href="signUp" class="get-started-btn">Get Started</a>

        </section>

        <div class="slider-container" role="region" aria-label="Featured Movie Posters">
            <div class="slider-header">Featured Movies</div>
            <div class="slider" id="slider" tabindex="0" aria-live="polite" aria-label="Movie Posters">
              <div class="slider-track" id="slider-track" role="list">
                <!-- Place your local images manually wrapped in containers like below -->
          
                <div class="movie-poster-container" tabindex="0" role="listitem" aria-label="Movie 1">
                  <img src="https://m.media-amazon.com/images/I/81ZpWSeRbVL._AC_UF1000,1000_QL80_.jpg" alt="Movie 1 poster" />
                  <div class="card-number">1</div>
                </div>
                <div class="movie-poster-container" tabindex="0" role="listitem" aria-label="Movie 2">
                  <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSrakPTsqdEOxYzMjxiAu2V8Lb_MV8luTzwiGTuyhzcnUdL5m5Pn8P0QUvDsOqSol-i27-eSg" alt="Movie 2 poster" />
                  <div class="card-number">2</div>
                </div>
                <div class="movie-poster-container" tabindex="0" role="listitem" aria-label="Movie 3">
                  <img src="https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_.jpg" alt="Movie 3 poster" />
                  <div class="card-number">3</div>
                </div>
                <div class="movie-poster-container" tabindex="0" role="listitem" aria-label="Movie 4">
                  <img src="https://m.media-amazon.com/images/M/MV5BMDMyZjFmZTctNDAxYi00MWM3LWJiYmItM2VhNWZiM2IwNjNlXkEyXkFqcGc@._V1_.jpg" alt="Movie 4 poster" />
                  <div class="card-number">4</div>
                </div>
                <div class="movie-poster-container" tabindex="0" role="listitem" aria-label="Movie 5">
                  <img src="https://m.media-amazon.com/images/M/MV5BZGQ5NGEyYTItMjNiMi00Y2EwLTkzOWItMjc5YjJiMjMyNTI0XkEyXkFqcGc@._V1_.jpg" alt="Movie 5 poster" />
                  <div class="card-number">5</div>
                </div>
                <!-- Add your images manually as needed -->
              </div>
            </div>
          </div>
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
            <img src="${pageContext.request.contextPath}/resources/images/system/nun.jpg" alt="">

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
                    <a href="https://www.facebook.com">Facebook</a>
                    <a href="https://twitter.com">Twitter</a>
                    <a href="https://www.instagram.com">Instagram</a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Movieहेरम. All rights reserved.</p>
        </div>
    </footer>

    <!-- JavaScript --> 
    
    <script>
        
        window.onload = function () {
    // Delay before fading out the loader
    setTimeout(function () {
        document.getElementById("loader").style.opacity = "0"; // Fade out loader
        setTimeout(function () {
            document.getElementById("loader").style.display = "none"; // Hide loader
            document.body.style.opacity = "1"; // Fade in the content
        }, 500); // 500ms for smooth fade transition
    }, 1000); // Show loader for 2 seconds
};



</script>
        
</body>
</html>
   
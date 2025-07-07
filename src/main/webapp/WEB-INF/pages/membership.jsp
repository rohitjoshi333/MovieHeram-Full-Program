<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieHerau - Choose Your Plan</title>
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/user.css" />
</head>
<body>
    <!-- Loader -->
    <div id="loader">
        <div class="spinner"></div>
        <div class="loading-text">Loading...</div>
    </div>

    <div class="plans-container">
        <div class="logo">Movieहेरम</div>
        <h2>Choose Your Vibe</h2>
        <div class="plans-grid">
            <div class="plan-card">
                <h3>Standard</h3>
                <div class="price">Npr.599/month</div>
                <ul class="features">
                    <li>HD Streaming</li>
                    <li>Good sound quality</li>
                    <li>Watch on 1 device</li>
                    <li>Ad-free experience</li>
                    <li>Download & watch offline</li>
                </ul>
                <form method="post" action="membership">
				    <input type="hidden" name="membershipId" value="3" />
				    <button class="btn-primary"><span>Get Standard</span></button>
				</form>

            </div>
            
            <div class="plan-card featured">
                <h3>Premium Plus+</h3>
                <div class="price">Npr1299/month</div>
                <ul class="features">
                    <li>4K Ultra HD + HDR</li>
                    <li>Dollby Atmos Support</li>
                    <li>Watch on 4 devices</li>
                    <li>Ad-free experience</li>
                    <li>Download & watch offline</li>
                    <li>Share with family</li>
                    <li>Exclusive premieres</li>
                </ul>
                
				<form method="post" action="membership">
				    <input type="hidden" name="membershipId" value="1" />
				    <button class="btn-primary"><span>Get Premium Plus+</span></button>
				</form>
            </div>

            <div class="plan-card">
                <h3>Premium</h3>
                <div class="price">Npr.999/month</div>
                <ul class="features">
                    <li>4K Ultra HD</li>
                    <li>Best sound quality</li>
                    <li>Watch on 2 devices</li>
                    <li>Ad-free experience</li>
                    <li>Download & watch offline</li>
                    <li>Share with a friend</li>
                </ul>
                <form method="post" action="membership">
				    <input type="hidden" name="membershipId" value="2" />
				    <button class="btn-primary"><span>Get Premium</span></button>
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
                <a href="#">Contact</a>
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
    <script>
            function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
    window.onload = function () {
        setTimeout(function () {
            document.getElementById("loader").style.opacity = "0"; // Fade out
            setTimeout(function () {
                document.getElementById("loader").style.display = "none"; // Hide after fade
            }, 200);
        }, 400); // Keeps the loader visible for 2 seconds
    };

    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ page import="java.util.*, com.movieheram.model.UserModel" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
    <%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("getStarted");
        return;
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>movieहेरम Admin Dashboard</title>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css"/>
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
<body style="opacity: 0; animation: fadeIn 0.6s ease-in-out forwards;">
    <div class="root">
    <div class="container">
        <nav class="sidebar">
            <div class="logo">
                <h2>👨‍💼 Admin DB</h2>
            </div>
            <ul class="nav-links">
                <li class="active" data-page="dashboard">
                    <span class="icon">📊</span> Dashboard
                </li>
                <li data-page="users">
                    <span class="icon">👥</span> Users
                </li>
                <li data-page="movies">
                    <span class="icon">🎥</span> Movies
                </li>
            </ul>
            <div class="admin-info">
                <div class="admin-avatar">
                    <img src="${pageContext.request.contextPath}/resources/images/user/${user.imageUrl}" style="width: 60px; border-radius: 100px;">
                </div>
                <div class="admin-details">
                    <p class="admin-name">${user.name}</p>
                    <p class="admin-role"></p>
                </div>
            </div>
        </nav>

        <main class="main-content">
            <header>           
                <h1 style="color: rgb(232, 0, 0);">Movieहेरम 🎬</h1>
                <div class="header-actions">
                   <a href="logout"><button class="logout" id="logout">Logout</button></a>
                </div>
            </header>
        
            <div class="page-content popup-wrapper" id="dashboard">
                <div class="stats-cards">
                    <div class="stat-card">
                        <h3>Total Users</h3>
                        <p class="stat-number">${userCount}</p>
                     </div>
                     <div class="stat-card">
                        <h3>Total Content</h3>
                        <p class="stat-number">${allMovieCount}</p>
                     </div>
                    <div class="stat-card">
                        <h3>Total Movies</h3>
                        <p class="stat-number">${movieCount}</p>
                    </div>
                    <div class="stat-card">
                        <h3>Total Series</h3>
                        <p class="stat-number">${seriesCount}</p>
                    </div>
                    <div class="stat-card">
                        <h3>Total Anime</h3>
                        <p class="stat-number">${animeCount}</p>
                    </div>
                    <div class="stat-card">
                        <h3>Total Standard Subscription</h3>
                        <p class="stat-number">${standardCount}</p>
                     </div>
                     <div class="stat-card">
                        <h3>Total Premium Subscription</h3>
                        <p class="stat-number">${premiumCount}</p>
                     </div>
                     <div class="stat-card">
                        <h3>Total Premium Plus Subscription</h3>
                        <p class="stat-number">${premiumPlusCount}</p>
                     </div>
                </div>

                <div class="activity-section">
				  <h1>Activity Chart</h1>
				
				  <div class="activity-wrapper">
				    <!-- Left Column -->
				    <div class="left-column">
				      <canvas id="contentPie"></canvas>
				      <img src="${pageContext.request.contextPath}/resources/images/system/linechart.png" class="linechart-img" />
				    </div>
				
				    <!-- Right Column -->
				    <div class="right-column">
				      <canvas id="subscriptionBar"></canvas>
				    </div>
				  </div>
				
				  <!-- Bottom Image -->
				  <div class="bottom-image">
				    <img src="${pageContext.request.contextPath}/resources/images/system/chartline.png" />
				  </div>
				</div>
            </div>

            <div class="page-content popup-wrapper hidden" id="users">
                <h1>User Management</h1>
                <c:if test="${not empty userMessage}">
				    <div style="margin-bottom: 20px; padding: 15px; border-radius: 8px;
				                background-color: ${fn:containsIgnoreCase(userMessage, 'fail') || fn:containsIgnoreCase(userMessage, 'error') ? '#f8d7da' : '#d4edda'};
				                color: ${fn:containsIgnoreCase(userMessage, 'fail') || fn:containsIgnoreCase(userMessage, 'error') ? '#721c24' : '#155724'};
				                border: 1px solid ${fn:containsIgnoreCase(userMessage, 'fail') || fn:containsIgnoreCase(userMessage, 'error') ? '#f5c6cb' : '#c3e6cb'};">
				        ${userMessage}
				    </div>
				    </c:if>
                <div class="users-table">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Plan</th>
                                <th>Image</th>
                                <th>Registered Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
	                        <tbody id="usersTableBody">
								   <c:forEach var="user" items="${users}">
									    <tr>
									        <td>${user.id}</td>
									        <td>${user.name}</td>
									        <td>${user.email}</td>
									        <td>${user.membership.membershipType}</td>
									        <td>${user.imageUrl}</td>
									        <td>${user.createdDate}</td>
									        <td>
									           <div style="position: relative; display: flex; gap: 10px;">
									           <button class="edit-btn" onclick="toggleFavorites('fav-${user.id}')">View</button>
												<!-- Hidden Favorite Popup Box -->
												        <div id="fav-${user.id}" class="fav-popup hidden">
												            <strong>Favorites by ${user.name}:</strong>
												            <c:choose>
													        <c:when test="${empty user.favoriteMovies}">
													            <p style="margin-top: 10px;">No favorite movies found.</p>
													        </c:when>
													        <c:otherwise>
													            <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
													                <c:forEach var="movie" items="${user.favoriteMovies}">
													                    <div style="text-align: center;">
													                        <c:choose>
													                            <c:when test="${fn:startsWith(movie.thumbnail, 'http')}">
													                                <img src="${movie.thumbnail}" style="width: 120px; height: auto;">
													                            </c:when>
													                            <c:otherwise>
													                                <img src="${pageContext.request.contextPath}/resources/images/movie/${movie.thumbnail}" style="width: 120px; height: auto;">
													                            </c:otherwise>
													                        </c:choose>
													                        <p>${movie.title}</p>
													                    </div>
													                </c:forEach>
													            </div>
													        </c:otherwise>
													    </c:choose>
												        </div>
																				        
									           <!-- Delete Button and Confirmation Box -->
													    <button onclick="toggleConfirm(${user.id})" class="delete-btn">Delete</button>
													    
													    <div id="confirm-${user.id}" class="confirm-box" style="display: none; position: absolute; top: 53%; left: 60%;">
													        Are you sure?
													        <div style="display: flex; gap: 10px;">
													            <a href="dashboard?action=deleteUser&id=${user.id}"
													               style="text-decoration: none; background-color: red; color: white; padding: 5px 10px; border-radius: 5px;">
													               Yes
													            </a>
													            <button onclick="toggleConfirm(${user.id})"
													                    style="background-color: gray; color: white; padding: 5px 10px; border-radius: 5px;">
													                No
													            </button>
													        </div>
													    </div>
													</div>
									        </td>
									    </tr>
									</c:forEach>
							</tbody>
                    </table>
                </div>
            </div>

            <div class="page-content popup-wrapper hidden" id="movies">
                <h1>Movie Management</h1>
                <c:if test="${not empty movieMessage}">
				    <div style="margin-bottom: 20px; padding: 15px; border-radius: 8px;
				                background-color: ${fn:containsIgnoreCase(movieMessage, 'fail') || fn:containsIgnoreCase(movieMessage, 'error') ? '#f8d7da' : '#d4edda'};
				                color: ${fn:containsIgnoreCase(movieMessage, 'fail') || fn:containsIgnoreCase(movieMessage, 'error') ? '#721c24' : '#155724'};
				                border: 1px solid ${fn:containsIgnoreCase(movieMessage, 'fail') || fn:containsIgnoreCase(movieMessage, 'error') ? '#f5c6cb' : '#c3e6cb'};">
				        ${movieMessage}
				    </div>
				</c:if>
                <div class="action-bar">
                    <div class="dropdown-container">
                        <button class="add-btn" id="addMovieBtn">Add New Movie</button>
						<form action="dashboard" method="post" enctype="multipart/form-data">
						  <input type="hidden" name="action" value="addMovie">
                        
                        <div class="dropdown-modal hidden" id="movieModal">
                            <div class="dropdown-modal-content">
                                <h2>Upload Movie</h2>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input type="text" name="title" required>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>Genre</label>
                                            <select name="genre" required>
                                                <option value="">Select Genre</option>
                                                <option value="Action">Action</option>
                                                <option value="Drama">Drama</option>
                                                <option value="Comedy">Comedy</option>
                                                <option value="Sci-Fi">Sci-Fi</option>
                                                <option value="Horror">Horror</option>
                                            </select>
                                        </div>
                                     <div class="form-group">
                                            <label>Type</label>
                                            <select name="type" required>
                                                <option value="">Select Type</option>
                                                <option value="Movie">Movie</option>
                                                <option value="Series">Series</option>
                                                <option value="Anime">Anime</option>
                                            </select>
                                            </div>
                                        <div class="form-group">
                                            <label>Release Year</label>
                                            <input type="number" name="releaseYear" required>
                                        </div>
                                    </div>
                                    
                                    <div class="preview-section">
                                        <div class="thumbnail-preview-container">
                                            <h3>Thumbnail</h3>
                                            <div class="form-group">
                                                <label>Poster URL</label>
                                                <input type="file" name="thumbnailFile">
												<input type="url" name="thumbnailUrl" placeholder="or paste image URL">
                                            </div>
                                        </div>
                                        
                                        <div class="video-preview-container">
                                            <h3>Content</h3>
                                            <div class="form-group">
                                                <label>Video File URL</label>
                                                <input type="file" name="video" accept="video/*" id="videoInput" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" class="cancel-btn">Cancel</button>
                                        <button type="submit" class="save-btn">Add Movie</button>
                                    </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="movie-table">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Genre</th>
                                <th>Type</th>
                                <th>Release Year</th>
                                <th>Thumbnail</th>
                                <th>Video</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
						<tbody id="movieTableBody">
					    <c:forEach var="movie" items="${movies}">
						        <tr>
						          <td>${movie.movieID}</td>
						          <td>${movie.title}</td>
						          <td>${movie.genre}</td>
						          <td>${movie.type}</td>
						          <td>${movie.releaseYear}</td>
						          <td>${movie.thumbnail}</td>
						          <td>${movie.video}</td>
						 		 <td>	
						 		 <div style="position: relative; display: flex; gap: 10px;">
									<button class="edit-btn" onclick="toggleEditModal(${movie.movieID})">Edit</button>
									<button onclick="toggleConfirm(${movie.movieID})" class="delete-btn">Delete</button>
									    
									    <div id="confirm-${movie.movieID}" class="confirm-box" style="display: none; position: absolute; top: 58%; left: 30%;">
									        Are you sure?
									        <div style="display: flex; gap: 10px;">
									        <form action="dashboard?action=deleteMovie" method="post">
								                <input type="hidden" name="movieID" value="${movie.movieID}">
								                <button type="submit" style="background-color: red; color: white; padding: 5px 10px; border-radius: 5px;">Yes</button>
								            </form>
									            <button onclick="toggleConfirm(${movie.movieID})"
									                    style="background-color: gray; color: white; padding: 5px 10px; border-radius: 5px;">
									                No
									            </button>
									            </div>
									            </div>
									</div>
									</td>
						        </tr>
						        </c:forEach>
						</tbody>
                        </table>
                </div>
                <c:forEach var="movie" items="${movies}">
				  <div class="dropdown-modal-edit hidden" id="editModal-${movie.movieID}">
				    <div class="dropdown-modal-content">
				      <form action="dashboard" method="post" enctype="multipart/form-data">
				        <input type="hidden" name="action" value="updateMovie" />
				        <input type="hidden" name="movieID" value="${movie.movieID}" />
				        <h2>Edit Movie</h2>
				
				        <div class="form-row">
				          <div class="form-group">
				            <label>Title</label>
				            <input type="text" name="title" value="${movie.title}" required />
				          </div>
				        </div>
				
				        <div class="form-row">
				          <div class="form-group">
				            <label>Genre</label>
				            <select name="genre" required>
				              <option value="Action" ${movie.genre == 'Action' ? 'selected' : ''}>Action</option>
				              <option value="Drama" ${movie.genre == 'Drama' ? 'selected' : ''}>Drama</option>
				              <option value="Comedy" ${movie.genre == 'Comedy' ? 'selected' : ''}>Comedy</option>
				              <option value="Sci-Fi" ${movie.genre == 'Sci-Fi' ? 'selected' : ''}>Sci-Fi</option>
				              <option value="Horror" ${movie.genre == 'Horror' ? 'selected' : ''}>Horror</option>
				            </select>
				          </div>
				          <div class="form-group">
				            <label>Type</label>
				            <select name="type" required>
				              <option value="Movie" ${movie.type == 'Movie' ? 'selected' : ''}>Movie</option>
				              <option value="Series" ${movie.type == 'Series' ? 'selected' : ''}>Series</option>
				              <option value="Anime" ${movie.type == 'Anime' ? 'selected' : ''}>Anime</option>
				            </select>
				          </div>
				          <div class="form-group">
				            <label>Release Year</label>
				            <input type="number" name="releaseYear" value="${movie.releaseYear}" required />
				          </div>
				        </div>
				
				        <div class="preview-section">
				          <div class="thumbnail-preview-container">
				            <h3>Thumbnail</h3>
				            <input type="file" name="thumbnailFile" />
				            <input type="url" name="thumbnailUrl" placeholder="or paste image URL" />
				          </div>
				          <div class="video-preview-container">
				            <h3>Content</h3>
				            <input type="file" name="video" accept="video/*" />
				          </div>
				        </div>
				
				        <div class="form-actions">
				          <button type="button" class="cancel-btn" onclick="closeEditModal(${movie.movieID})">Cancel</button>
				          <button type="submit" class="save-btn">Update Movie</button>
				        </div>
				      </form>
				    </div>
				  </div>
				</c:forEach>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
<script>
	
		// DOM Elements
		const navLinks = document.querySelectorAll('.nav-links li');
		const pages = document.querySelectorAll('.page-content');
		const movieModal = document.getElementById('movieModal');
		const addMovieBtn = document.getElementById('addMovieBtn');
		const movieForm = document.getElementById('movieForm');
		const usersTableBody = document.getElementById('usersTableBody');
		const movieTableBody = document.getElementById('movieTableBody');
		const moviesGrid = document.querySelector('.movies-grid');
		const cancelBtns = document.querySelectorAll('.cancel-btn');
		const editBtn = document.getElementById('editBtn');
		const editModal = document.getElementById('editModal');

		
		navLinks.forEach(link => {
		    link.addEventListener('click', () => {
		        // Remove active class from all links
		        navLinks.forEach(l => l.classList.remove('active'));
		        // Add active class to clicked link
		        link.classList.add('active');
	
		        // Show corresponding page
		        const pageName = link.getAttribute('data-page');
		        pages.forEach(page => {
		            if (page.id === pageName) {
		                page.classList.remove('hidden');
		            } else {
		                page.classList.add('hidden');
		            }
		        });
		    });
		});
		// Toggle Modal
		addMovieBtn?.addEventListener('click', (e) => {
		    e.stopPropagation();
		    movieModal.classList.toggle('hidden');
		});
		// Toggle Modal
		editBtn?.addEventListener('click', (e) => {
		    e.stopPropagation();
		    movieModal.classList.toggle('hidden');
		});
		
		// Close modal when clicking outside
		document.addEventListener('click', (e) => {
		    if (!movieModal.contains(e.target) && e.target !== addMovieBtn) {
		        movieModal.classList.add('hidden');
		    }
		});
		
		// Close modal with cancel button
		cancelBtns.forEach(btn => {
		    btn.addEventListener('click', () => {
		        movieModal.classList.add('hidden');
		    });
		});
		
		
		function toggleConfirm(id) {
		    const box = document.getElementById('confirm-' + id);
		    box.style.display = box.style.display === 'none' ? 'block' : 'none';
		}
		
		 function toggleEditModal(movieId) {
		      const modal = document.getElementById("editModal-" + movieId);
		      modal.classList.toggle("hidden");
		  }

		  function closeEditModal(movieId) {
		      document.getElementById("editModal-" + movieId).classList.add("hidden");
		  }
		
		const subscriptionBar = new Chart(document.getElementById('subscriptionBar'), {
			  type: 'bar',
			  data: {
			    labels: ['Standard', 'Premium', 'Premium Plus'],
			    datasets: [{
			      label: 'Subscriptions',
			      data: [${standardCount}, ${premiumCount}, ${premiumPlusCount}],
			      backgroundColor: ['#f39c12', '#9b59b6', '#2ecc71'],
			      borderRadius: 10
			    }]
			  },
			  options: {
			    responsive: true,
			    maintainAspectRatio: false,
			    plugins: {
			      title: {
			        display: true,
			        text: 'User Subscriptions',
			        font: {
				          size: 30,
				          weight: 'bold'
				        }
			      },
			      legend: { display: false }
			    },
			    scales: {
			    	x: {
			    	      ticks: {
			    	        font: {
			    	          size: 14,   
			    	          weight: 'bold',
			    	          color:'#000000',
			    	        }
			    	      }
			    	    },
			      y: { beginAtZero: true }
			    }
			  }
			});
		const contentPie = new Chart(document.getElementById('contentPie'), {
			  type: 'doughnut',
			  data: {
			    labels: ['Movies', 'Series', 'Anime'],
			    datasets: [{
			      label: 'Content Type',
			      data: [${movieCount}, ${seriesCount}, ${animeCount}],
			      backgroundColor: ['#e74c3c', '#8e44ad', '#16a085'],
			      borderWidth: 2
			    }]
			  },
			  options: {
			    responsive: true,
			    cutout: '70%', // Makes it doughnut
			    layout:{
			    	padding:{
			    		right:70
			    	}
			    },
			    plugins: {
			      title: {
			        display: true,
			        text: 'Content Type',
			        font: {
			          size: 30,
			          weight: 'bold'
			        }
			      },
			  
			      legend: {
			    	  display: true,
			          position: 'left',    
			        labels: {
			          usePointStyle: true,
			          pointStyle: 'rect',
			        	  font: {
			                  size: 14
			                },
			                boxWidth: 40,
			                padding: 20
			        }
			      },
			      datalabels: {
			    	  anchor: 'end',       // Anchor the label to the edge of the slice
			    	  align: 'end',      // push it outward
			          color: '#000',
			          formatter: (value, context) => {
			            return context.chart.data.labels[context.dataIndex]; // Show label like "Movies"
			          },
			          font: {
			            weight: 'bold',
			            size: 20
			          },
			          offset: 10  
			        }
			    }
			  },
			  plugins: [ChartDataLabels]
			});
		  
		    function toggleFavorites(id) {
		        const box = document.getElementById(id);
		        box.classList.toggle('hidden');
		    }

		
		
	</script>
	
</body>
</html>
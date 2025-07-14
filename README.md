# 🎬 MovieHeram
MovieHeram is a Java-based mini streaming web application that provides users with an intuitive platform to browse, watch, and manage movies and animations. Built with Java Servlets, JSP, MySQL/MongoDB, and modern frontend technologies, MovieHeram delivers a lightweight yet dynamic streaming experience with user authentication, admin controls, and rich media management features.

🧰 Tech Stack
Java (JDK 11+)

JSP & Servlets

Apache Tomcat (Web Server)

MySQL or MongoDB (Database)

HTML5 / CSS3 / JavaScript

File-based Video Storage (Local)

Eclipse IDE

📂 Project Structure

movieheram/
├── src/
│   └── main/
│       ├── java/
│       │   └── com.movieheram/
│       │       ├── controller/
│       │       └── filter/
│       └── webapp/
│           ├── WEB-INF/
│           ├── css/
│           ├── js/
│           ├── resources/
│           │   └── images/
│           └── index.jsp
├── .gitignore
├── .classpath
├── .project
└── README.md

🚀 Features
🏠 Home Page with a curated list of available movies and animations

🎥 Video Player to stream uploaded videos stored locally

🔐 User Registration & Login with session-based authentication

⭐ User Profiles allowing users to mark and manage favorite movies

🔍 Dynamic Search and Filter by movie title, genre, or other criteria

🛠️ Admin Dashboard for full control including:

Adding, editing, and removing movies

Monitoring user activity and site status dynamically

💬 User Reviews and Ratings system for interactive feedback

📂 Media Storage managed through a combination of file system and database (MySQL or MongoDB)

🎨 Responsive and animated UI/UX powered by Bootstrap and CSS

⚙️ Deployable on Apache Tomcat with Java Servlet backend

🧪 How to Run Locally

Clone the repository:

git clone https://github.com/rohitjoshi333/movieheram.git
Open in Eclipse:

Go to File > Import > Existing Maven/Java Project

Select the cloned project directory and import

Configure Apache Tomcat:

Add Apache Tomcat server in Eclipse Server settings

Right-click on the project > Run As > Run on Server

Set up Database:

Create the required database schema in MySQL or MongoDB

Update database connection details in your project configuration files (e.g., context.xml or properties file)

Access the app:

Open your browser and navigate to:

http://localhost:8080/movieheram

🧱 Future Improvements
Integration with external APIs for movie metadata

Advanced recommendation system based on user preferences

Social features like sharing and following other users

Mobile app version using React Native or Flutter

More sophisticated media transcoding and streaming

📜 License
This project is for educational and demonstration purposes only. No copyrighted media is included or distributed.
Feel free to use and modify the code as per your needs.

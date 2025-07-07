package com.movieheram.model;

public class MovieModel {
	private int movieID;
	private String title;
	private String genre;
		private String type;
	private int releaseYear;
	private String thumbnail;
	private String video;
	private boolean isFav;
	
	public MovieModel() {
	}
	
	public MovieModel(int movieID, String title, String genre, String type, int releaseYear, String thumbnail, String video, boolean isFav) {
		super();
		this.movieID = movieID;
		this.title = title;
		this.genre = genre;
		this.releaseYear = releaseYear;
		this.type = type;
		this.releaseYear = releaseYear;
		this.thumbnail = thumbnail;
		this.video = video;
		this.isFav = isFav;
	}
	
	public MovieModel(int movieID, String title, String genre, String type, int releaseYear, String thumbnail, String video) {
		super();
		this.movieID = movieID;
		this.title = title;
		this.genre = genre;
		this.releaseYear = releaseYear;
		this.type = type;
		this.releaseYear = releaseYear;
		this.thumbnail = thumbnail;
		this.video = video;
	}
	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	
	public boolean getIsFav() {
		return isFav;
	}
	
	public void setIsFav(boolean isFav) {
		this.isFav = isFav;
	}
	

}

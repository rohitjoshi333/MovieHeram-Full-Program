package com.movieheram.model;

public class FavoriteModel {
	 private int favoriteID;
	 private int movieID;
	 private int userID;
	 
	public FavoriteModel(int favoriteID, int movieID, int userID) {
		super();
		this.favoriteID = favoriteID;
		this.movieID = movieID;
		this.userID = userID;
	}

	public int getFavoriteID() {
		return favoriteID;
	}

	public void setFavoriteID(int favoriteID) {
		this.favoriteID = favoriteID;
	}

	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	
	
}

package com.movieheram.model;

import java.sql.Date;
import java.util.List;

import com.movieheram.model.MovieModel; 

public class UserModel {
	private int id;
	private String name;
	private String email;
	private String password;
	private String imageUrl;
	private Boolean is_admin;
	private MembershipModel membership;
	private Date createdDate;
    private List<MovieModel> favoriteMovies;

	
	public UserModel() {
	}
	
	public UserModel(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public UserModel(int id, String name, String email, String password, String imageUrl, Boolean is_admin,
			MembershipModel membership, Date createdDate) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.imageUrl = imageUrl;
		this.is_admin = is_admin;
		this.membership = membership;
		this.createdDate = createdDate;
	}
	
	public UserModel(String name, String email, String password, String imageUrl, MembershipModel membership) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.imageUrl = imageUrl;
		this.membership = membership;
	}
	
	public UserModel(String name, String email, String password, MembershipModel membership) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.membership = membership;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Boolean getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(Boolean is_admin) {
		this.is_admin = is_admin;
	}

	public MembershipModel getMembership() {
		return membership;
	}

	public void setMembership(MembershipModel membership) {
		this.membership = membership;
	}
	
	public Date getCreatedDate() {
	    return createdDate;
	}
	
	public void setCreatedDate(Date createdDate) {
	    this.createdDate = createdDate;
	}
	
	 public List<MovieModel> getFavoriteMovies() {
	        return favoriteMovies;
	    }
	 public void setFavoriteMovies(List<MovieModel> favoriteMovies) {
	        this.favoriteMovies = favoriteMovies;
	    }

}

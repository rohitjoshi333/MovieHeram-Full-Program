package com.movieheram.model;

public class MembershipModel {
	private int membershipId;
	private String membershipType;
	private int price;
	private String features;
	
	public MembershipModel() {
		
	}

	public MembershipModel(int membershipId, String membershipType, int price, String features) {
		super();
		this.membershipId = membershipId;
		this.membershipType = membershipType;
		this.price = price;
		this.features = features;
	}

	public int getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(int membershipId) {
		this.membershipId = membershipId;
	}

	public String getMembershipType() {
		return membershipType;
	}

	public void setMembershipType(String membershipType) {
		this.membershipType = membershipType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}
	
	

}

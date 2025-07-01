package com.zomtao.dto;

public class MenuDto {

	private Long id; // For update or fetch
	private String title; // Menu title
	private Long userId; // Foreign key (restaurant owner)

	// Optional: restaurant name for response, if needed
	private String restaurantName;

	// Constructors
	public MenuDto() {
	}

	public MenuDto(Long id, String title, Long userId, String restaurantName) {
		this.id = id;
		this.title = title;
		this.userId = userId;
		this.restaurantName = restaurantName;
	}

	// Getters & Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
}

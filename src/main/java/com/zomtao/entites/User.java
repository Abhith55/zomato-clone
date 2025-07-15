package com.zomtao.entites;

import java.time.LocalDateTime;

import org.hibernate.annotations.ColumnDefault;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity

@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long uid;
	private String ownerName;
	@Column(name = "restaurent_name", columnDefinition = "VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
	private String restaurentName;
	private LocalDateTime registrationDate;
	private String state;
	private String city;
	private String panorAddharCard;
	@Column(unique = true)
	private String username;
	private String password;
	private String email;
	private String role;

	@ColumnDefault("1")
	private Integer status; // 1 = Active, 2 = Inactive, 3 = Deleted

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Long uid, String ownerName, String restaurentName, LocalDateTime registrationDate, String state,
			String city, String panorAddharCard, String username, String password, String email, String role,
			Integer status) {
		super();
		this.uid = uid;
		this.ownerName = ownerName;
		this.restaurentName = restaurentName;
		this.registrationDate = registrationDate;
		this.state = state;
		this.city = city;
		this.panorAddharCard = panorAddharCard;
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
		this.status = status;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getRestaurentName() {
		return restaurentName;
	}

	public void setRestaurentName(String restaurentName) {
		this.restaurentName = restaurentName;
	}

	public LocalDateTime getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(LocalDateTime registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPanorAddharCard() {
		return panorAddharCard;
	}

	public void setPanorAddharCard(String panorAddharCard) {
		this.panorAddharCard = panorAddharCard;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}

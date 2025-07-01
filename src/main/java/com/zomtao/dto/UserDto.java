package com.zomtao.dto;

import java.time.LocalDate;

import com.zomtao.enums.Role;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class UserDto {

	 	@NotBlank(message = "Owner name is required")
	    private String ownerName;

	    @NotBlank(message = "Restaurant name is required")
	    private String restaurentName;

	    @NotBlank(message = "State is required")
	    private String state;
	    	
	    @NotBlank(message = "City is required")
	    private String city;

	    @NotBlank(message = "PAN or Aadhaar is required")
	    private String panorAddharCard;

	    @NotBlank(message = "Username is required")
	    @Size(min = 4, message = "Username must be at least 4 characters")
	    private String username;

	    @NotBlank(message = "Password is required")
	    @Size(min = 6, message = "Password must be at least 6 characters")
	    private String password;

	    private LocalDate registrationDate;
	    
	    
	    @Email(message = "Enter a valid email")
	    private String email;
        @NotNull(message = "Role selection is mandotary")
	    private Role role;
		public UserDto() {
			super();
			// TODO Auto-generated constructor stub
		}
		public UserDto(@NotBlank(message = "Owner name is required") String ownerName,
				@NotBlank(message = "Restaurant name is required") String restaurentName,
				@NotBlank(message = "State is required") String state,
				@NotBlank(message = "City is required") String city,
				@NotBlank(message = "PAN or Aadhaar is required") String panorAddharCard,
				@NotBlank(message = "Username is required") @Size(min = 4, message = "Username must be at least 4 characters") String username,
				@NotBlank(message = "Password is required") @Size(min = 6, message = "Password must be at least 6 characters") String password,
				@Email(message = "Enter a valid email") String email,
				@NotNull(message = "Role selection is mandotary") Role role) {
			super();
			this.ownerName = ownerName;
			this.restaurentName = restaurentName;
			this.state = state;
			this.city = city;
			this.panorAddharCard = panorAddharCard;
			this.username = username;
			this.password = password;
			this.email = email;
			this.role = role;
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
		public Role getRole() {
			return role;
		}
		public void setRole(Role role) {
			this.role = role;
		}
		public LocalDate getRegistrationDate() {
			return registrationDate;
		}
		public void setRegistrationDate(LocalDate registrationDate) {
			this.registrationDate = registrationDate;
		}

		
         
}

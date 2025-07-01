package com.zomtao.entites;

public class LoginUser {

	private String userName ;
	private String message;
	private String role;
	private String sendRedirectURL;
	public LoginUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public LoginUser(String userName, String message, String role, String sendRedirectURL) {
		super();
		this.userName = userName;
		this.message = message;
		this.role = role;
		this.sendRedirectURL = sendRedirectURL;
	}

    

	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getSendRedirectURL() {
		return sendRedirectURL;
	}
	public void setSendRedirectURL(String sendRedirectURL) {
		this.sendRedirectURL = sendRedirectURL;
	}
		
	
	
	
	
}

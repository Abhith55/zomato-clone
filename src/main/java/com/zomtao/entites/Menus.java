package com.zomtao.entites;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "restuarent_menus")
public class Menus {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id;

	private String title;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	public Menus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Menus(Long id, String title, User user) {
		super();
		this.id = id;
		this.title = title;
		this.user = user;
	}

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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Menus [id=" + id + ", title=" + title + ", user=" + user + "]";
	}

}

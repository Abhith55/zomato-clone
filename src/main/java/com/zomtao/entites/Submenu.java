package com.zomtao.entites;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "submenu_tbl")
public class Submenu {
	@Id
	@Column(name = "submenu_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long subMenuid;

	private String title;

	private double price;

	@ManyToOne(fetch = FetchType.LAZY)
	private Menus menus;

	@ManyToOne(fetch = FetchType.LAZY)
	private User user;

	public Submenu() {
		super();
		// TODO Auto-generated constructor stub

	}

	public Submenu(Long subMenuid, String title, double price, Menus menus, User user) {
		super();
		this.subMenuid = subMenuid;
		this.title = title;
		this.price = price;
		this.menus = menus;
		this.user = user;
	}

	public Long getSubMenuid() {
		return subMenuid;
	}

	public void setSubMenuid(Long subMenuid) {
		this.subMenuid = subMenuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Menus getMenus() {
		return menus;
	}

	public void setMenus(Menus menus) {
		this.menus = menus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}

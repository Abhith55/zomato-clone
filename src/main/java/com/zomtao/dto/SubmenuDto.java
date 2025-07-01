package com.zomtao.dto;

public class SubmenuDto {

	private Long subMenuid;

	private String title;

	private double price;

	private Long menusId;

	private Long userId;

	public SubmenuDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SubmenuDto(Long subMenuid, String title, double price, Long menusId, Long userId) {
		super();
		this.subMenuid = subMenuid;
		this.title = title;
		this.price = price;
		this.menusId = menusId;
		this.userId = userId;
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

	public Long getMenusId() {
		return menusId;
	}

	public void setMenusId(Long menusId) {
		this.menusId = menusId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}

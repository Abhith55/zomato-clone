package com.zomtao.constant;

/**
 * Central place to define all URL path constants used in the application.
 */
public class AppPathConstant {

	private AppPathConstant() {
	} // Prevent instantiation

	// 🌐 General Routes
	public static final String LOGIN = "/login";
	public static final String MAIN = "/main";
	public static final String LOGOUT = "/logout";
	public static final String API_LOGIN = "/api/login";

	// 🧑‍💼 USER MODULE
	public static final String API_USER_BASE = "/api/users";
	public static final String API_USER_REGISTER = "/register";
	// public static final String API_USER_GET_ALL = API_USER_BASE;
	public static final String API_USER_ADD_MENU = "/addMenu";
	public static final String API_USER_GET_MENU_BY_ID = "/{userId}";

	// 🍽️ MENUS MODULE
	public static final String API_MENU_BASE = "/api/menus";
	public static final String MENU_ADD = "/menus/add";
	public static final String MENU_SHOW = "/menus/show";
	public static final String SUBMENU_SHOW = "/menus/SubMenu";

	// 🍕 SUBMENUS MODULE
	public static final String API_SUBMENU_BASE = "/api/subMenus";
	public static final String API_SUBMENU_ADD = "/add";
	// In AppPathConstant
	public static final String API_SUBMENU_SHOW_FULL = "/shows/{userId}/{menuId}";

	// 📄 UI (JSP Page) Routes
	public static final String USER_ADD = "/user/add";
	public static final String USER_SHOW = "/user";
	public static final String MENU_ADD_PAGE = "/menus/add";
	public static final String MENU_SHOW_PAGE = "/menus/show";
	public static final String SUBMENU_SHOW_PAGE = "/menus/SubMenu";

	// 🔓 PUBLIC Routes (allowed by filter without session)
	public static final String[] PUBLIC_URLS = { LOGIN, API_LOGIN, LOGOUT, API_USER_REGISTER };
}

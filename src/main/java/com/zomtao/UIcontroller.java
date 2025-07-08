package com.zomtao;

import static com.zomtao.constant.AppPathConstant.LOGIN;
import static com.zomtao.constant.AppPathConstant.MAIN;
import static com.zomtao.constant.AppPathConstant.MENU_ADD;
import static com.zomtao.constant.AppPathConstant.MENU_SHOW;
import static com.zomtao.constant.AppPathConstant.SUBMENU_SHOW;
import static com.zomtao.constant.AppPathConstant.USER_ADD;
import static com.zomtao.constant.AppPathConstant.USER_SHOW;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UIcontroller {

	@GetMapping(LOGIN)
	public String showLoginPage() {
		return "login"; // Renders /WEB-INF/views/login.jsp
	}

	@GetMapping(MAIN)
	public String showMainPage() {
		return "main"; // maps to main.jsp
	}

	@GetMapping(USER_ADD)
	public String loadAddUserForm() {
		return "user/addUser"; // maps to /WEB-INF/views/user/addUser.jsp
	}

	@GetMapping(USER_SHOW)
	public String loadAllUser() {
		return "user/showUser"; // maps to /WEB-INF/views/user/addUser.jsp
	}

	@GetMapping(MENU_ADD)
	public String saveMenu() {
		return "menus/addMenus"; // maps to /WEB-INF/views/user/addUser.jsp
	}

	@GetMapping(MENU_SHOW)
	public String showMenu() {
		return "menus/showMenu"; // maps to /WEB-INF/views/user/addUser.jsp
	}

	@GetMapping(SUBMENU_SHOW)
	public String showSubMenu() {
		return "menus/showSubMenu"; // maps to /WEB-INF/views/user/addUser.jsp
	}

}

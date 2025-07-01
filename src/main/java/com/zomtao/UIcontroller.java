package com.zomtao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UIcontroller {

	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // Renders /WEB-INF/views/login.jsp
	}

	@GetMapping("/main")
	public String showMainPage() {
		return "main"; // maps to main.jsp
	}

	@GetMapping("/user/add")
	public String loadAddUserForm() {
		return "user/addUser"; // maps to /WEB-INF/views/user/addUser.jsp
	}

	@GetMapping("/user")
	public String loadAllUser() {
		return "user/showUser"; // maps to /WEB-INF/views/user/addUser.jsp
	}

}

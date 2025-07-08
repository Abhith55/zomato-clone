package com.zomtao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zomtao.constant.AppPathConstant;
import com.zomtao.entites.LoginRequest;
import com.zomtao.entites.LoginUser;
import com.zomtao.service.impl.UserServiceImpl;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping(AppPathConstant.API_LOGIN)
public class LoginController {

	@Autowired
	private UserServiceImpl serviceImpl;

	@PostMapping
	public ResponseEntity<LoginUser> checkLogin(@RequestBody LoginRequest loginRequest, HttpSession session) {
		try {
			System.out.print("Login request " + loginRequest);
			LoginUser loginUser = serviceImpl.checkLogin(loginRequest);
			if (loginUser.getRole().equals("RESTAURANT_OWNER")) {
				session.setAttribute("RESTAURANT_OWNER", loginUser.getRole());
				session.setAttribute("username", loginUser.getUserName());
				System.out.println("session created");
			} else {
				session.setAttribute("ADMIN", loginUser.getRole());
				session.setAttribute("username", loginUser.getUserName());
				System.out.println("session created" + loginUser.getRole());
			}
			return ResponseEntity.ok(loginUser);
		} catch (RuntimeException e) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null); // TODO: handle exception
		}
	}

	@GetMapping(AppPathConstant.LOGIN)
	public String showLoginPage() {
		return "login"; // Maps to /WEB-INF/views/login.jsp
	}

	@PostMapping(AppPathConstant.LOGOUT)
	public ResponseEntity<String> logout(HttpSession session) {
		session.invalidate();
		System.out.println("🔥 Session Invalidated!");
		return ResponseEntity.ok("Logout success");
	}
}

package com.zomtao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zomtao.entites.LoginRequest;
import com.zomtao.entites.LoginUser;
import com.zomtao.service.impl.UserServiceImpl;

@RestController
@RequestMapping("/api/login")
public class LoginController {

	@Autowired
	private UserServiceImpl serviceImpl;

	@PostMapping
	public ResponseEntity<LoginUser> checkLogin(@RequestBody LoginRequest loginRequest) {
		try {
			System.out.print("Login request " + loginRequest);
			LoginUser loginUser = serviceImpl.checkLogin(loginRequest);
			return ResponseEntity.ok(loginUser);
		} catch (RuntimeException e) {

			return ResponseEntity.badRequest().body(null);
			// TODO: handle exception
		}

	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // Maps to /WEB-INF/views/login.jsp
	}

}

package com.zomtao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zomtao.dto.MenuDto;
import com.zomtao.dto.UserDto;
import com.zomtao.emailService.emailService;
import com.zomtao.service.MenusService;
import com.zomtao.service.UserService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private MenusService menusService;

	@Autowired
	private emailService emailService;

	@PostMapping("/register")
	public ResponseEntity<?> registerUser(@Valid @RequestBody UserDto userDto, BindingResult result) {
		if (result.hasErrors()) {
			StringBuilder errorMessage = new StringBuilder();
			result.getFieldErrors().forEach(fieldError -> errorMessage.append(fieldError.getField()).append(": ")
					.append(fieldError.getDefaultMessage()).append(";"));
			return ResponseEntity.badRequest().body("Validation Error(s) : 	" + errorMessage.toString());

		}

		int status = userService.registerUser(userDto);

		if (status == 1) {
			return ResponseEntity.ok("✅ User registered successfully.");
		} else if (status == 0) {
			return ResponseEntity.badRequest().body("User Registeration failed");
		} else {
			return ResponseEntity.internalServerError().body("Something Went Wrong");
		}

	}

	@GetMapping
	public ResponseEntity<?> getAllUser() {
		List<UserDto> userDto = userService.getAllUser();
		if (userDto.isEmpty()) {
			return ResponseEntity.noContent().build();
		}

		return ResponseEntity.ok(userDto);

	}

	/*
	 * @PostMapping("/sendTestEmail") public ResponseEntity<String> sendTestEmail()
	 * { emailService.sendEmail("abhishekth2012@gmail.com", "Test Subject",
	 * "Hello from Spring Boot!"); return
	 * ResponseEntity.ok("Email Sent Successfully!"); }
	 */

	@PostMapping("/addMenu")
	public ResponseEntity<?> addMenus(@RequestBody MenuDto menuDto) {

		int status = menusService.addMenus(menuDto);

		if (status == 1) {
			return ResponseEntity.ok("Menu create SuccessFully");
		} else if (status == 0) {
			return ResponseEntity.badRequest().body("Menu insertion failed");
		} else {
			return ResponseEntity.internalServerError().body("Something Went Wrong");
		}
	}

}

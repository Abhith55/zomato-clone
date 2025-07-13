package com.zomtao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zomtao.constant.AppPathConstant;
import com.zomtao.dto.MenuDto;
import com.zomtao.dto.UserDto;
import com.zomtao.emailService.emailService;
import com.zomtao.service.MenusService;
import com.zomtao.service.UserService;
import jakarta.validation.Valid;
@RestController
@RequestMapping(AppPathConstant.API_USER_BASE)
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private MenusService menusService;

	@Autowired
	private emailService emailService;

	@PostMapping(AppPathConstant.API_USER_REGISTER)
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
		System.out.print("controller called");
		List<UserDto> userDto = userService.getAllUser();
		if (userDto.isEmpty()) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(userDto);
	}

	@GetMapping(AppPathConstant.API_USER_GET_ALL)
	public ResponseEntity<Page<UserDto>> getAllUser(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size, @RequestParam(required = false) String query) {
		Pageable pageable = PageRequest.of(page, size);
		Page<UserDto> userPage = userService.getAllUser(pageable, query);
		if (userPage.isEmpty()) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(userPage);
	}

	/*
	 * @PostMapping("/sendTestEmail") public ResponseEntity<String> sendTestEmail()
	 * { emailService.sendEmail("abhishekth2012@gmail.com", "Test Subject",
	 * "Hello from Spring Boot!"); return
	 * ResponseEntity.ok("Email Sent Successfully!"); }
	 */

	@PostMapping(AppPathConstant.API_USER_ADD_MENU)
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

	// In your MenuController
	@GetMapping(AppPathConstant.API_USER_GET_MENU_BY_ID)
	public List<MenuDto> getMenusByUser(@PathVariable Long userId) {

		System.out.print("Controller called" + userId);
		return menusService.getMenusByUser(userId);
	}

}

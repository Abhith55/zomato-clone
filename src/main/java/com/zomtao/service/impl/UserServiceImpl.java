package com.zomtao.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.zomtao.dto.UserDto;
import com.zomtao.entites.LoginRequest;
import com.zomtao.entites.LoginUser;
import com.zomtao.entites.User;
import com.zomtao.mapper.UserMapper;
import com.zomtao.repo.UserRepo;
import com.zomtao.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserRepo userrepo;

	@Autowired
	private PasswordEncoder passwordEncoder;

	/*
	 * @Autowired private emailService emailService;
	 */ @Override
	public int registerUser(UserDto dto) {
		try {
			if (dto.getRegistrationDate() == null) {
				dto.setRegistrationDate(LocalDateTime.now());
				logger.info("registrationDate was null, set to current date: {}", dto.getRegistrationDate());
			}
			User user = userMapper.dtotoEntity(dto);
			user.setPassword(passwordEncoder.encode(dto.getPassword()));
			logger.info(" User status " + user.getStatus());
			User savedUser = userrepo.save(user);
			if (savedUser != null && savedUser.getUid() != null) {
				// emailService.sendEmail(user.getEmail(), user.getUsername(),
				// user.getPassword());
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<UserDto> getAllUser() {
		List<User> users = userrepo.findAll();
		return users.stream().map(userMapper::entitytodto).collect(Collectors.toList());
	}

	@Override
	public Page<UserDto> getAllUser(Pageable pageable, String query) {
		if (query != null && !query.isEmpty()) {
			Page<User> users = userrepo.searchUser(query, pageable);
			return users.map(userMapper::entitytodto); // ✅ Using MapStruct directly
		} else {
			Page<User> users = userrepo.findAllOrderedUser(pageable);
			return users.map(userMapper::entitytodto); // ✅ Using MapStruct directly
		}
	}

	@Override
	public LoginUser checkLogin(LoginRequest request) {
		User user = userrepo.findByUsername(request.getUsername());
		if (user == null) {
			throw new RuntimeException("User not found Exception");
		}
		if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
			throw new RuntimeException("Invalid Password Check Your Password again");
		}
		LoginUser loginUser = new LoginUser();
		loginUser.setUserName(user.getUsername());
		loginUser.setRole(user.getRole());
		if (user.getRole().equals("ADMIN")) {
			loginUser.setMessage("Welcome  Admin !");
			loginUser.setSendRedirectURL("/admin/dashboard");
		} else if (user.getRole().equals("RESTAURANT_OWNER")) {
			loginUser.setMessage("Welcome  RESTAURANT_OWNER !");
			loginUser.setSendRedirectURL("http://localhost:8081/home");
		}
		return loginUser;
	} // TODO Auto-generated method stub

	@Override
	public int changeStatus(UserDto userDto) {
		try {
			Optional<User> userOptional = userrepo.findById(userDto.getUid());
			if (userOptional.isPresent()) {
				User user = userOptional.get();
				user.setStatus(userDto.getStatus());
				userrepo.save(user);
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;

			// TODO: handle exception
		}

	}

}

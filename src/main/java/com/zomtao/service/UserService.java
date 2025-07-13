package com.zomtao.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.zomtao.dto.UserDto;
import com.zomtao.entites.LoginRequest;
import com.zomtao.entites.LoginUser;

public interface UserService {
	public int registerUser(UserDto dto);

	List<UserDto> getAllUser();

	public Page<UserDto> getAllUser(Pageable pageable, String query);

	public LoginUser checkLogin(LoginRequest request);
}

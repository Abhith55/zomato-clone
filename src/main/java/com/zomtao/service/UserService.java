package com.zomtao.service;
import java.util.List;
import com.zomtao.dto.UserDto;
import com.zomtao.entites.LoginRequest;
import com.zomtao.entites.LoginUser;
public interface UserService {
	public int  registerUser(UserDto dto);
    
	List<UserDto> getAllUser();
	
	
	public LoginUser checkLogin(LoginRequest request);

}

package com.zomtao.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.zomtao.dto.UserDto;
import com.zomtao.entites.User;

@Mapper(componentModel = "spring")
public interface UserMapper {

	  @Mapping(target = "uid", ignore = true)
	 
    User dtotoEntity(UserDto userDto);

    UserDto entitytodto(User user);
}


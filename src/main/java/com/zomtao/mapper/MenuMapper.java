package com.zomtao.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import com.zomtao.dto.MenuDto;
import com.zomtao.entites.Menus;
import com.zomtao.entites.User;

@Mapper(componentModel = "spring")
public interface MenuMapper {

	@Mapping(target = "user", source = "userId", qualifiedByName = "mapUserFromId")
	@Mapping(target = "id", ignore = true)
	Menus dtoToEntity(MenuDto dto);

	@Mapping(target = "userId", source = "user.uid")
	@Mapping(target = "restaurantName", ignore = true)
	MenuDto entityToDto(Menus menu);

	@Named("mapUserFromId")
	public static User mapUserFromId(Long id) {
		if (id == null)
			return null;
		User u = new User();
		u.setUid(id);
		return u;
	}
}

package com.zomtao.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import com.zomtao.dto.SubmenuDto;
import com.zomtao.entites.Menus;
import com.zomtao.entites.Submenu;
import com.zomtao.entites.User;

@Mapper(componentModel = "spring")
public interface SubMenuMapper {
	@Mapping(target = "user", source = "userId", qualifiedByName = "mapUserFromId")
	@Mapping(source = "menusId", target = "menus", qualifiedByName = "mapMenuFromId")
	@Mapping(target = "subMenuid", ignore = true)
	Submenu dtotoEntitySubmenu(SubmenuDto submenuDto);

	@Mapping(target = "userId", source = "user.uid")
	@Mapping(source = "menus.id", target = "menusId")
	SubmenuDto entitytoDto(Submenu submenu);

	@Named("mapMenuFromId")
	public static Menus mapMenuFromId(Long id) {
		if (id == null)
			return null;
		Menus menus = new Menus();
		menus.setId(id);
		return menus;
	}

	@Named("mapUserFromId")
	public static User mapUserFromId(Long id) {
		if (id == null)
			return null;
		User user = new User();
		user.setUid(id);
		return user;
	}
}

package com.zomtao.service;

import java.util.List;

import com.zomtao.dto.MenuDto;

public interface MenusService {

	public int addMenus(MenuDto menus);

	public List<MenuDto> getMenusByUser(Long userId);
}

package com.zomtao.service;

import java.util.List;

import com.zomtao.dto.SubmenuDto;

public interface SubMenusService {

	int createSubmenuDtos(List<SubmenuDto> submenuDto);

	List<SubmenuDto> getSubmenusByMenuId(Long menuId);

}

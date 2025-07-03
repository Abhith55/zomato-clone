package com.zomtao.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zomtao.dto.MenuDto;
import com.zomtao.entites.Menus;
import com.zomtao.mapper.MenuMapper;
import com.zomtao.repo.MenuRepository;
import com.zomtao.service.MenusService;

@Service
public class MenuServiceImpl implements MenusService {

	@Autowired
	private MenuMapper mapper;

	@Autowired
	private MenuRepository repo;

	@Override
	public int addMenus(MenuDto menus) {
		try {

			Menus menu = mapper.dtoToEntity(menus);

			System.out.print(menu);
			Menus saveMenu = repo.save(menu);

			if (saveMenu != null && saveMenu.getId() != null) {

				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public List<MenuDto> getMenusByUser(Long userId) {
		// TODO Auto-generated method stub
		List<Menus> list = repo.findByUserUid(userId);
		return list.stream().map(mapper::entityToDto).collect(Collectors.toList());
	}

}

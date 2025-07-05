package com.zomtao.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zomtao.dto.SubmenuDto;
import com.zomtao.entites.Submenu;
import com.zomtao.mapper.SubMenuMapper;
import com.zomtao.repo.SubMenuRepo;
import com.zomtao.service.SubMenusService;

@Service
public class SubMenusImpl implements SubMenusService {

	@Autowired
	private SubMenuMapper mapper;

	@Autowired
	private SubMenuRepo subMenuRepo;

	@SuppressWarnings("null")
	@Override

	public int createSubmenuDtos(List<SubmenuDto> submenuDto) {

		try {

			List<Submenu> list = submenuDto.stream().map(mapper::dtotoEntitySubmenu).collect(Collectors.toList());

			List<Submenu> savedlist = subMenuRepo.saveAll(list);
			if (savedlist != null || savedlist.size() == submenuDto.size()) {
				return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;

	}

	@Override
	public List<SubmenuDto> getsubmenuByUserandMenuId(Long userId, Long menuId) {
		try {
			List<Submenu> slist = subMenuRepo.findByUser_UidAndMenus_Id(userId, menuId);
			return slist.stream().map(mapper::entitytoDto).collect(Collectors.toList());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return Collections.emptyList();
		}

	}

}

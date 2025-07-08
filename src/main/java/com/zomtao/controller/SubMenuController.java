package com.zomtao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zomtao.constant.AppPathConstant;
import com.zomtao.dto.SubmenuDto;
import com.zomtao.service.SubMenusService;

@RestController
@RequestMapping(AppPathConstant.API_SUBMENU_BASE)
public class SubMenuController {

	@Autowired
	private SubMenusService subMenusService;

	@PostMapping(AppPathConstant.API_SUBMENU_ADD)
	public ResponseEntity<String> addSubMenu(@RequestBody List<SubmenuDto> submenuDto) {
		int i = subMenusService.createSubmenuDtos(submenuDto);
		if (i == 1) {
			return ResponseEntity.ok("SubMenus addedSuccesfuuly");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to  add Submenus");
		}
	}

	@GetMapping(AppPathConstant.API_SUBMENU_SHOW_FULL)
	// @GetMapping("/shows/{userId}/{menuId}")
	public ResponseEntity<List<SubmenuDto>> getMenusByUser(@PathVariable Long userId, @PathVariable Long menuId) {

		System.out.println("Controller called with userId: " + userId + " and menuId: " + menuId);

		List<SubmenuDto> submenus = subMenusService.getsubmenuByUserandMenuId(userId, menuId);

		if (submenus.isEmpty()) {
			return ResponseEntity.noContent().build(); // HTTP 204
		}

		return ResponseEntity.ok(submenus); // HTTP 200 with data
	}
}

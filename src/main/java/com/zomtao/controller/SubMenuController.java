package com.zomtao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zomtao.dto.SubmenuDto;
import com.zomtao.service.SubMenusService;

@RestController
@RequestMapping("/api/subMenus")
public class SubMenuController {

	@Autowired
	private SubMenusService subMenusService;

	@PostMapping("/add")
	public ResponseEntity<String> addSubMenu(@RequestBody List<SubmenuDto> submenuDto) {
		int i = subMenusService.createSubmenuDtos(submenuDto);
		if (i == 1) {
			return ResponseEntity.ok("SubMenus addedSuccesfuuly");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to  add Submenus");
		}
	}
}

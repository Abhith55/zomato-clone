package com.zomtao.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zomtao.entites.Submenu;

public interface SubMenuRepo extends JpaRepository<Submenu, Long> {

	List<Submenu> findByUser_UidAndMenus_Id(Long userId, Long menuId);

}

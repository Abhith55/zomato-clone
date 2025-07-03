package com.zomtao.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zomtao.entites.Menus;

public interface MenuRepository extends JpaRepository<Menus, Long> {

	List<Menus> findByUserUid(Long userId);
}

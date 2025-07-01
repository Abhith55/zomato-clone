package com.zomtao.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zomtao.entites.Menus;

public interface MenuRepository extends JpaRepository<Menus, Long> {

}

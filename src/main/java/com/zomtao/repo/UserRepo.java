package com.zomtao.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zomtao.entites.User;

public interface UserRepo extends JpaRepository<User, Long> {

	User findByUsername(String userName);

}

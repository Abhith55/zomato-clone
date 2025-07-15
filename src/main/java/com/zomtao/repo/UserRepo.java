package com.zomtao.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.zomtao.entites.User;

public interface UserRepo extends JpaRepository<User, Long> {

	User findByUsername(String userName);

	@Query("SELECT u FROM User u ORDER BY  CASE WHEN u.role = 'ADMIN' THEN 0 ELSE 1 END, u.status ASC,u.registrationDate DESC")
	Page<User> findAllOrderedUser(Pageable pageable);

// search query 
	@Query("SELECT u FROM User u WHERE " + "LOWER(u.username) LIKE LOWER(CONCAT('%', :query, '%')) "
			+ "OR LOWER(u.ownerName) LIKE LOWER(CONCAT('%', :query, '%')) "
			+ "OR LOWER(u.panorAddharCard) LIKE LOWER(CONCAT('%', :query, '%'))")
	Page<User> searchUser(@Param("query") String query, Pageable pageable);

}

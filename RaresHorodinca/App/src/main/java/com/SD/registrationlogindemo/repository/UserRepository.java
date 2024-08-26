package com.SD.registrationlogindemo.repository;

import com.SD.registrationlogindemo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

   // List<User> findByFirstName(String firstName);

    // Find users by last name
   // List<User> findByLastName(String lastName);

    // Delete a user by email
   // void deleteByEmail(String email);
}
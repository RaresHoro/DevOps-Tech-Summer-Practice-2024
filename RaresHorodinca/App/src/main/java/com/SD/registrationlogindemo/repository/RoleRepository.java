package com.SD.registrationlogindemo.repository;

import com.SD.registrationlogindemo.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
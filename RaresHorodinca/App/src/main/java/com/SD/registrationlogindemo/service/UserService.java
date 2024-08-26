package com.SD.registrationlogindemo.service;

import com.SD.registrationlogindemo.dto.UserDto;
import com.SD.registrationlogindemo.entity.User;

import java.util.List;

public interface UserService {
    void saveUser(UserDto userDto);

    UserDto editUser(Long userId, UserDto userDto);

    void deleteUser(Long userId);

    User findByEmail(String email);
    User findById(Long userId);

    List<UserDto> findAllUsers();
}

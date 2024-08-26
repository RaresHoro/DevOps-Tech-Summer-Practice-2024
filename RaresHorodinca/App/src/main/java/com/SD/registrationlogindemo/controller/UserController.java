package com.SD.registrationlogindemo.controller;

import com.SD.registrationlogindemo.dto.UserDto;
import com.SD.registrationlogindemo.repository.UserRepository;
import com.SD.registrationlogindemo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;


    private final UserRepository userRepository ;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    // Edit user
    @PutMapping("/{userId}")
    public ResponseEntity<UserDto> editUser(@PathVariable Long userId, @RequestBody UserDto userDto) {
        UserDto editedUser = userService.editUser(userId, userDto);
        return ResponseEntity.ok(editedUser);
    }

   /* @PostMapping("/users/delete/{userId}")
    public String deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return "redirect:/users";
    }*/

    /*@PostMapping("/users/delete-by-email")
    public void deleteUserByEmail(@RequestBody Map<String, String> requestBody) {
        String email = requestBody.get("Email");
        userRepository.deleteByEmail(email);
    }*/


}

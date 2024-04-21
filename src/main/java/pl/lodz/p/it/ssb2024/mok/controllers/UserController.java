package pl.lodz.p.it.ssb2024.mok.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import pl.lodz.p.it.ssb2024.mok.services.UserService;

import java.util.UUID;

@RestController("/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/block")
    public ResponseEntity<String> blockUser(@RequestBody UUID id) {
        userService.blockUser(id);

        return ResponseEntity.status(HttpStatus.OK).body("User blocked");
    }

    @PostMapping("/unblock")
    public ResponseEntity<String> unblockUser(@RequestBody UUID id) {
        userService.unblockUser(id);

        return ResponseEntity.status(HttpStatus.OK).body("User unblocked");
    }
}
package pl.lodz.p.it.ssbd2024.mok.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record AuthenticatedChangePasswordRequest(
        @NotBlank(message = "Old password cannot be blank.")
        @Size(min = 8, max = 50, message = "Old password must be between 8 and 50 characters.")
        String oldPassword,

        @NotBlank(message = "New password cannot be blank.")
        @Size(min = 8, max = 50, message = "Password must be between 8 and 50 characters.")
        String newPassword) {
}

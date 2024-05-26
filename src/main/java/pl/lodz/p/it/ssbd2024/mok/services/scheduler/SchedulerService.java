package pl.lodz.p.it.ssbd2024.mok.services.scheduler;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pl.lodz.p.it.ssbd2024.exceptions.TokenGenerationException;
import pl.lodz.p.it.ssbd2024.model.tokens.AccountVerificationToken;
import pl.lodz.p.it.ssbd2024.model.User;
import pl.lodz.p.it.ssbd2024.mok.repositories.AccountVerificationTokenRepository;
import pl.lodz.p.it.ssbd2024.mok.repositories.UserRepository;
import pl.lodz.p.it.ssbd2024.mok.services.EmailService;
import pl.lodz.p.it.ssbd2024.mok.services.VerificationTokenService;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
@Transactional
public class SchedulerService {
    @Value("${account.removeUnverifiedAccountAfterHours}")
    private int removeUnverifiedAccountsAfterHours;
    @Value("${app.url}")
    private String appUrl;
    @Value("${account.deactivateAccountAfterDays}")
    private int deactivateAccountAfterDays;

    private final UserRepository userRepository;
    private final AccountVerificationTokenRepository accountVerificationTokenRepository;
    private final VerificationTokenService verificationTokenService;
    private final EmailService emailService;

    @PreAuthorize("permitAll()")
    public void deleteNonVerifiedUsers() {
        LocalDateTime beforeTime = LocalDateTime.now().minusHours(removeUnverifiedAccountsAfterHours);
        List<User> users = userRepository.getUsersByCreatedAtBeforeAndVerifiedIsFalse(beforeTime);
        users.forEach(user -> {
            emailService.sendAccountDeletedEmail(user.getEmail(), user.getFirstName(), user.getLanguage());
            userRepository.delete(user);
            userRepository.flush();
        });
    }

    @PreAuthorize("permitAll()")
    public void sendEmailVerifyAccount() {
        LocalDateTime beforeTime = LocalDateTime.now().minusHours(removeUnverifiedAccountsAfterHours / 2);
        LocalDateTime afterTime = beforeTime.plusMinutes(10);
        List<User> users = userRepository.getUsersByCreatedAtBeforeAndCreatedAtAfterAndVerifiedIsFalse(beforeTime, afterTime);
        users.forEach(user -> {
            Optional<AccountVerificationToken> token = accountVerificationTokenRepository.findByUserId(user.getId());
            if (token.isEmpty()) {
                return;
            }
            URI uri = URI.create(appUrl + "/verify/" + token);
            emailService.sendVerifyAccountEmail(user.getEmail(), user.getFirstName(), uri.toString(), user.getLanguage());
        });
    }

    @PreAuthorize("permitAll()")
    public void checkForInactiveUsers() throws TokenGenerationException {
        List<User> users = userRepository.getUserByActiveIsTrueAndLastSuccessfulLogin(LocalDateTime.now().minusDays(deactivateAccountAfterDays));
        for(User user : users) {
            user.setActive(false);
            String token = verificationTokenService.generateAccountActivateToken(user);
            emailService.sendAccountActivateAfterBlock(user.getEmail(), user.getFirstName(), token, user.getLanguage());
            userRepository.saveAndFlush(user);
        }
    }
}

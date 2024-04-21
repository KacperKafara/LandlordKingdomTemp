package pl.lodz.p.it.ssb2024.mok.services;

import pl.lodz.p.it.ssb2024.model.Administrator;
import pl.lodz.p.it.ssb2024.model.Owner;
import pl.lodz.p.it.ssb2024.model.User;

import java.util.UUID;

public interface UserService {
    User getUser(UUID id);

    void registerUser(User newUser);

    void blockUser(UUID id);

    void unblockUser(UUID id);





}

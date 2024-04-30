package pl.lodz.p.it.ssbd2024.mok.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import pl.lodz.p.it.ssbd2024.exceptions.AccessLevelAlreadyRemovedException;
import pl.lodz.p.it.ssbd2024.exceptions.NotFoundException;
import pl.lodz.p.it.ssbd2024.messages.UserExceptionMessages;
import pl.lodz.p.it.ssbd2024.model.Owner;
import pl.lodz.p.it.ssbd2024.model.User;
import pl.lodz.p.it.ssbd2024.mok.repositories.OwnerRepository;
import pl.lodz.p.it.ssbd2024.mok.repositories.UserRepository;
import pl.lodz.p.it.ssbd2024.mok.services.OwnerService;

import java.util.Optional;
import java.util.UUID;

@Transactional(propagation = Propagation.REQUIRES_NEW)
@Service
public class OwnerServiceImpl implements OwnerService {
    private final OwnerRepository ownerRepository;
    private final UserRepository userRepository;

    @Autowired
    public OwnerServiceImpl(OwnerRepository ownerRepository, UserRepository userRepository) {
        this.ownerRepository = ownerRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Owner removeOwnerAccessLevel(UUID id) throws AccessLevelAlreadyRemovedException, NotFoundException {
        Owner owner = ownerRepository.findByUserId(id).orElseThrow(() -> new NotFoundException(UserExceptionMessages.NOT_FOUND));
        if (!owner.isActive()) {
            throw new AccessLevelAlreadyRemovedException(UserExceptionMessages.ACCESS_LEVEL_REMOVED);
        }
        owner.setActive(false);
        return ownerRepository.saveAndFlush(owner);
    }

    @Override
    public Owner addOwnerAccessLevel(UUID id) throws NotFoundException {
        Optional<Owner> ownerOptional = ownerRepository.findByUserId(id);

        Owner owner;
        if (ownerOptional.isPresent()) {
            owner = ownerOptional.get();
        } else {
            User user = userRepository.findById(id).orElseThrow(() -> new NotFoundException(UserExceptionMessages.NOT_FOUND));
            owner = new Owner();
            owner.setUser(user);
        }

        if (owner.isActive()) {
            return owner;
        }

        owner.setActive(true);
        return ownerRepository.saveAndFlush(owner);
    }
}
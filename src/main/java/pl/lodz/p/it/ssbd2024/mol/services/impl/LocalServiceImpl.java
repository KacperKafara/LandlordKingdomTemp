package pl.lodz.p.it.ssbd2024.mol.services.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import pl.lodz.p.it.ssbd2024.exceptions.NotFoundException;
import pl.lodz.p.it.ssbd2024.exceptions.handlers.ErrorCodes;
import pl.lodz.p.it.ssbd2024.messages.LocalExceptionMessages;
import pl.lodz.p.it.ssbd2024.exceptions.*;
import pl.lodz.p.it.ssbd2024.exceptions.handlers.ErrorCodes;
import pl.lodz.p.it.ssbd2024.messages.LocalMessages;
import pl.lodz.p.it.ssbd2024.messages.UserExceptionMessages;
import pl.lodz.p.it.ssbd2024.model.Address;
import pl.lodz.p.it.ssbd2024.model.Local;
import pl.lodz.p.it.ssbd2024.model.LocalState;
import pl.lodz.p.it.ssbd2024.model.LocalState;
import pl.lodz.p.it.ssbd2024.model.Owner;
import pl.lodz.p.it.ssbd2024.mok.repositories.OwnerRepository;
import pl.lodz.p.it.ssbd2024.mol.dto.AddLocalRequest;
import pl.lodz.p.it.ssbd2024.mol.dto.LocalReportResponse;
import pl.lodz.p.it.ssbd2024.mol.repositories.AddressRepository;
import pl.lodz.p.it.ssbd2024.mol.repositories.LocalRepository;
import pl.lodz.p.it.ssbd2024.mol.services.LocalService;

import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class LocalServiceImpl implements LocalService {
    private final LocalRepository localRepository;
    private final AddressRepository addressRepository;
    private final OwnerRepository ownerRepository;

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Local addLocal(AddLocalRequest addLocalRequest, UUID ownerId) throws GivenAddressAssignedToOtherLocalException, NotFoundException {
        Owner owner = ownerRepository.findById(ownerId).orElseThrow(() -> new
                NotFoundException(UserExceptionMessages.NOT_FOUND, ErrorCodes.USER_NOT_FOUND));
        Local newLocal = new Local(
                addLocalRequest.name(),
                addLocalRequest.description(),
                addLocalRequest.size(),
                addLocalRequest.address(),
                owner,
                addLocalRequest.marginFee(),
                addLocalRequest.rentalFee()
        );
        throw new GivenAddressAssignedToOtherLocalException(LocalMessages.ADDRESS_ASSIGNED,
                ErrorCodes.ADDRESS_ASSIGNED);
//        Optional<Address> existingAddress = addressRepository.findByNumberAndStreetAndCityAndZipAndCountry(
//                addLocalRequest.address().getNumber(),
//                addLocalRequest.address().getStreet(),
//                addLocalRequest.address().getCity(),
//                addLocalRequest.address().getZip(),
//                addLocalRequest.address().getCountry()
//        );
//        if (existingAddress.isPresent()) {
//            List<Local> existingLocal = localRepository.findByAddressAndStateNotContaining(addLocalRequest.address(), LocalState.ARCHIVED);
//            if (!existingLocal.isEmpty()) {
//                boolean hasOtherState = existingLocal.stream()
//                        .anyMatch(local -> local.getState() != LocalState.WITHOUT_OWNER);
//                if (hasOtherState && existingLocal.size() > 1) {
//                    throw new GivenAddressAssignedToOtherLocalException(LocalMessages.ADDRESS_ASSIGNED,
//                            ErrorCodes.ADDRESS_ASSIGNED);
//                } else {
//                    newLocal = existingLocal.getFirst();
//                    newLocal.setOwner(owner);
//                    newLocal.setState(LocalState.UNAPPROVED);
//                }
//            }
//        } else {
//            addressRepository.saveAndFlush(addLocalRequest.address());
//        }
//        return localRepository.saveAndFlush(newLocal);
    }

    @Override
    @PreAuthorize("isAuthenticated()")
    public List<Local> getActiveLocals() {
        return localRepository.findAllByState(LocalState.ACTIVE);
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public List<Local> getUnapprovedLocals() {
        return localRepository.findAllByState(LocalState.UNAPPROVED);
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public List<Local> getOwnLocals(UUID id) {
        return localRepository.findAllByOwnerId(id);
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public LocalReportResponse getLocalReport(UUID id) throws NotFoundException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Local editLocal(UUID id, Local local) throws NotFoundException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Local leaveLocal(UUID userId, UUID localId) throws InvalidLocalState, NotFoundException {
        Local local = localRepository.findByOwner_User_IdAndId(userId, localId).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));
        if (local.getState() != LocalState.INACTIVE) {
            throw new InvalidLocalState(LocalExceptionMessages.LOCAL_NOT_INACTIVE, ErrorCodes.LOCAL_NOT_INACTIVE);
        }
        local.setOwner(null);
        local.setState(LocalState.WITHOUT_OWNER);
        return localRepository.saveAndFlush(local);

    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Local setFixedFee(UUID localId, UUID ownerId,  BigDecimal marginFee, BigDecimal rentalFee) throws NotFoundException {
        Local local = localRepository.findByOwner_User_IdAndId(ownerId, localId).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));

        if (local.getState() == LocalState.RENTED) {
            local.setNextMarginFee(marginFee);
            local.setNextRentalFee(rentalFee);
        } else {
            local.setMarginFee(marginFee);
            local.setRentalFee(rentalFee);
        }

        return localRepository.saveAndFlush(local);
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public List<Local> getAllLocals() {
        return localRepository.findAll();
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public Local changeLocalAddress(UUID id, Address address) throws GivenAddressAssignedToOtherLocalException, NotFoundException {
        throw new UnsupportedOperationException("Not supported yet.");
    }


    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public Local editLocalByAdmin(UUID id, Local newLocal) throws NotFoundException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public Local approveLocal(UUID id) throws NotFoundException, InvalidLocalState {
        Local local = localRepository.findById(id).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));

        if (local.getState() != LocalState.UNAPPROVED) {
            throw new InvalidLocalState(LocalExceptionMessages.LOCAL_NOT_UNAPPROVED, ErrorCodes.LOCAL_NOT_UNAPPROVED, LocalState.UNAPPROVED, local.getState());
        }

        local.setState(LocalState.INACTIVE);
        return localRepository.saveAndFlush(local);
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public Local rejectLocal(UUID id) throws NotFoundException, InvalidLocalState {
        Local local = localRepository.findById(id).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));

        if (local.getState() != LocalState.UNAPPROVED) {
            throw new InvalidLocalState(LocalExceptionMessages.LOCAL_NOT_UNAPPROVED, ErrorCodes.LOCAL_NOT_UNAPPROVED, LocalState.UNAPPROVED, local.getState());
        }

        local.setState(LocalState.WITHOUT_OWNER);
        local.setOwner(null);
        return localRepository.saveAndFlush(local);
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public List<LocalReportResponse> getAllReports(UUID ownerId) throws NotFoundException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public Local archiveLocal(UUID id) throws NotFoundException, InvalidLocalState {
        Local local = localRepository.findById(id).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));
        if (local.getState() != LocalState.WITHOUT_OWNER) {
            throw new InvalidLocalState(LocalExceptionMessages.INVALID_LOCAL_STATE_ARCHIVE, ErrorCodes.INVALID_LOCAL_STATE_ARCHIVE, LocalState.WITHOUT_OWNER, local.getState());
        }
        local.setState(LocalState.ARCHIVED);
        return localRepository.saveAndFlush(local);
    }

    @Override
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    public Local getLocal(UUID id) throws NotFoundException {
        return localRepository.findById(id).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Local getOwnLocal(UUID id, UUID ownerId) throws NotFoundException {
        return localRepository.findByOwner_User_IdAndId(ownerId, id).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));
    }

    @Override
    public Local getActiveLocal(UUID id) throws NotFoundException {
        return localRepository.findByIdAndState(id, LocalState.ACTIVE).orElseThrow(() -> new NotFoundException(LocalExceptionMessages.LOCAL_NOT_FOUND, ErrorCodes.LOCAL_NOT_FOUND));
    }
}

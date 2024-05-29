package pl.lodz.p.it.ssbd2024.mol.services.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.lodz.p.it.ssbd2024.model.Payment;
import pl.lodz.p.it.ssbd2024.model.Rent;
import pl.lodz.p.it.ssbd2024.mol.exceptions.WrongEndDateException;
import pl.lodz.p.it.ssbd2024.mol.repositories.PaymentRepository;
import pl.lodz.p.it.ssbd2024.mol.repositories.RentRepository;
import pl.lodz.p.it.ssbd2024.mol.repositories.VariableFeeRepository;
import pl.lodz.p.it.ssbd2024.mol.services.RentService;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class RentServiceImpl implements RentService {
    private final RentRepository rentRepository;
    private final PaymentRepository paymentRepository;
    private final VariableFeeRepository variableFeeRepository;

    @Override
    @PreAuthorize("hasRole('TENANT')")
    public Rent getRent(UUID id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public List<Rent> getCurrentRents(UUID ownerId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Rent payForRent(UUID rentId, UUID ownerId, Payment payment) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('OWNER')")
    public Rent editEndDate(UUID rentId, UUID ownerId, Rent rent) throws WrongEndDateException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('TENANT')")
    public List<Rent> getCurrentRentsForTenant(UUID tenantId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    @PreAuthorize("hasRole('TENANT')")
    public List<Rent> getArchivalRentsForTenant(UUID tenantId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
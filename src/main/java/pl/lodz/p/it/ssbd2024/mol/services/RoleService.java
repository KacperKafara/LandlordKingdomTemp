package pl.lodz.p.it.ssbd2024.mol.services;

import pl.lodz.p.it.ssbd2024.exceptions.NotFoundException;
import pl.lodz.p.it.ssbd2024.mol.dto.GetRoleResponse;
import pl.lodz.p.it.ssbd2024.exceptions.RoleRequestAlreadyExistsException;
import pl.lodz.p.it.ssbd2024.exceptions.UserAlreadyHasRoleException;

import java.util.UUID;

public interface RoleService {

    GetRoleResponse getAll();

    GetRoleResponse requestRole(UUID tenantId) throws RoleRequestAlreadyExistsException, UserAlreadyHasRoleException;

    void accept(UUID id) throws NotFoundException;

    void reject(UUID id) throws NotFoundException;
}

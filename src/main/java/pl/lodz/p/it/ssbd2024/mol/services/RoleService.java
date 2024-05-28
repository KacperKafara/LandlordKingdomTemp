package pl.lodz.p.it.ssbd2024.mol.services;

import pl.lodz.p.it.ssbd2024.exceptions.NotFoundException;
import pl.lodz.p.it.ssbd2024.mol.dto.GetRoleResponse;
import pl.lodz.p.it.ssbd2024.exceptions.RoleRequestAlreadyExistsException;
import pl.lodz.p.it.ssbd2024.exceptions.UserIsOwnerAlreadyException;

import java.util.UUID;

public interface RoleService {

    GetRoleResponse getAll();

    GetRoleResponse getRole(UUID tenantId) throws RoleRequestAlreadyExistsException, UserIsOwnerAlreadyException;

    void accept(UUID id) throws NotFoundException;

    void delete(UUID id) throws NotFoundException;
}

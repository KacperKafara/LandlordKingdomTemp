package pl.lodz.p.it.ssbd2024.mol.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import pl.lodz.p.it.ssbd2024.model.FixedFee;

import java.util.UUID;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface FixedFeeRepository extends JpaRepository<FixedFee, UUID> {
}

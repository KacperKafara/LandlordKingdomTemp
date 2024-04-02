package pl.lodz.p.it.ssb2024.Model.DomainModel;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.lodz.p.it.ssb2024.Model.Users.Owner;

import java.math.BigDecimal;
import java.util.UUID;

@Entity
@NoArgsConstructor
@Table(name = "locals")
@Getter
public class Local {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(columnDefinition = "uuid", name = "id")
    private UUID id;

    @Setter
    @Column(nullable = false)
    private String name;

    @Setter
    private String description;

    @Setter
    @Column(nullable = false)
    private int size;

    @Enumerated(EnumType.STRING)
    @Setter
    private LocalState state = LocalState.UNAPPROVED;

    @OneToOne
    @JoinColumn(name = "address_id", referencedColumnName = "id", nullable = false, updatable = false)
    private Address address;

    @Setter
    @ManyToOne
    private Owner owner;

    @Setter
    @Column(name = "margin_fee", nullable = false, precision = 10, scale = 2)
    private BigDecimal marginFee;

    @Setter
    @Column(name = "rental_fee", nullable = false, precision = 10, scale = 2)
    private BigDecimal rentalFee;

    public Local(String name,
                 String description,
                 int size,
                 Address address,
                 Owner owner,
                 BigDecimal marginFee,
                 BigDecimal rentalFee) {
        this.name = name;
        this.description = description;
        this.size = size;
        this.address = address;
        this.owner = owner;
        this.marginFee = marginFee;
        this.rentalFee = rentalFee;
    }
}

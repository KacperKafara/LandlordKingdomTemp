package pl.lodz.p.it.ssbd2024.mol.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import pl.lodz.p.it.ssbd2024.exceptions.*;
import pl.lodz.p.it.ssbd2024.exceptions.handlers.ErrorCodes;
import pl.lodz.p.it.ssbd2024.messages.RentExceptionMessages;
import pl.lodz.p.it.ssbd2024.model.Local;
import pl.lodz.p.it.ssbd2024.model.Rent;
import org.springframework.web.server.ResponseStatusException;
import pl.lodz.p.it.ssbd2024.exceptions.NotFoundException;
import pl.lodz.p.it.ssbd2024.exceptions.WrongEndDateException;
import pl.lodz.p.it.ssbd2024.exceptions.InvalidLocalState;
import pl.lodz.p.it.ssbd2024.mol.dto.*;
import pl.lodz.p.it.ssbd2024.mol.mappers.*;
import pl.lodz.p.it.ssbd2024.mol.services.*;
import pl.lodz.p.it.ssbd2024.util.Signer;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/me")
@RequiredArgsConstructor
@Scope("prototype")
@Transactional(propagation = Propagation.NEVER)
public class MeOwnerController {
    private final LocalService localService;
    private final ApplicationService applicationService;
    private final RentService rentService;
    private final PaymentService paymentService;
    private final VariableFeeService variableFeeService;
    private final FixedFeeService fixedFeeService;
    private final Signer signer;


    @GetMapping("/locals")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<List<GetOwnLocalsResponse>> getOwnLocals() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Jwt jwt = (Jwt) authentication.getPrincipal();
        UUID id = UUID.fromString(jwt.getSubject());

        return ResponseEntity.ok(LocalMapper.toGetOwnLocalsResponseList(localService.getOwnLocals(id)));
    }

    @GetMapping("locals/{id}")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<OwnLocalDetailsResponse> getLocal(@PathVariable UUID id) {
        UUID ownerId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
        try {
            Local local = localService.getOwnLocal(id, ownerId);
            return ResponseEntity
                    .ok()
                    .eTag(signer.generateSignature(local.getId(), local.getVersion()))
                    .body(LocalMapper.toOwnLocalDetailsResponse(local));
        } catch (NotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage(), e);
        }
    }

    @GetMapping("/locals/{id}/applications")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<List<GetOwnLocalApplicationsResponse>> getOwnLocalApplications(@PathVariable UUID id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @PostMapping("/locals/{id}/rent")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<AcceptApplicationResponse> acceptApplication(@PathVariable UUID id, @RequestBody AcceptApplicationRequest acceptApplicationRequest) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @GetMapping("/locals/{id}/reports")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<LocalReportResponse> getReportData(@PathVariable UUID id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @PutMapping("/locals/{id}")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<EditLocalResponse> editLocal(@PathVariable UUID id, @RequestHeader(HttpHeaders.IF_MATCH) String tagValue, @RequestBody EditLocalRequest editLocalRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Jwt jwt = (Jwt) authentication.getPrincipal();
        UUID userId = UUID.fromString(jwt.getSubject());
        try {
            return ResponseEntity.ok(LocalMapper.toEditLocalResponse(localService.editLocal(userId, id, editLocalRequest, tagValue)));
        } catch (NotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage(), e);
        } catch (ApplicationOptimisticLockException e) {
            throw new ResponseStatusException(HttpStatus.PRECONDITION_FAILED, e.getMessage(), e);
        }
    }

    @GetMapping("/rents/current")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<List<RentForOwnerResponse>> getCurrentRents() {
        UUID ownerId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
        List<Rent> rents = rentService.getCurrentOwnerRents(ownerId);
        return ResponseEntity.ok(RentMapper.rentForOwnerResponseList(rents));
    }

    @PostMapping("/rents/{id}/payment")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<RentForOwnerResponse> payRent(@PathVariable UUID id, @RequestBody NewPaymentRequest newPaymentRequest) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @PostMapping("/rents/{id}/payments")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<RentPaymentsResponse> getRentPayments(@PathVariable UUID id,
                                                                      @RequestBody RentPaymentsRequest rentPaymentsRequest,
                                                                      @RequestParam(name = "pageNum", defaultValue = "0") int pageNum,
                                                                      @RequestParam(name = "pageSize", defaultValue = "10") int pageSize){
        Pageable pageable = PageRequest.of(pageNum, pageSize, Sort.by("date").descending());
        UUID userId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
        try {
            LocalDate startDate =  LocalDate.parse(rentPaymentsRequest.startDate());
            LocalDate endDate =  LocalDate.parse(rentPaymentsRequest.endDate());
            return ResponseEntity.ok(PaymentMapper.toRentPaymentsResponse(paymentService.getRentPayments(id, userId, startDate, endDate, pageable)));
        }catch (DateTimeParseException exception) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    RentExceptionMessages.DATE_PARSING_ERROR,
                    new DateParsingException(RentExceptionMessages.DATE_PARSING_ERROR, exception, ErrorCodes.DATE_PARSING_ERROR));
        }

    }

    @PostMapping("/rents/{id}/fixed-fees")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<RentFixedFeesResponse> getFixedFees(@PathVariable UUID id,
                                                                @RequestBody RentPaymentsRequest rentPaymentsRequest,
                                                                @RequestParam(name = "pageNum", defaultValue = "0") int pageNum,
                                                                @RequestParam(name = "pageSize", defaultValue = "10") int pageSize){
        Pageable pageable = PageRequest.of(pageNum, pageSize, Sort.by("date").descending());
        UUID userId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
        try {
            LocalDate startDate =  LocalDate.parse(rentPaymentsRequest.startDate());
            LocalDate endDate =  LocalDate.parse(rentPaymentsRequest.endDate());
            return ResponseEntity.ok(FixedFeeMapper.toRentFixedFeesResponse(fixedFeeService.getRentFixedFees(id, userId, startDate, endDate, pageable)));
        }catch (DateTimeParseException exception) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    RentExceptionMessages.DATE_PARSING_ERROR,
                    new DateParsingException(RentExceptionMessages.DATE_PARSING_ERROR, exception, ErrorCodes.DATE_PARSING_ERROR));
        }

    }

    @PostMapping("/rents/{id}/variable-fees")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<RentVariableFeesResponse> getVariableFees(@PathVariable UUID id,
                                                             @RequestBody RentPaymentsRequest rentPaymentsRequest,
                                                             @RequestParam(name = "pageNum", defaultValue = "0") int pageNum,
                                                             @RequestParam(name = "pageSize", defaultValue = "10") int pageSize){
        Pageable pageable = PageRequest.of(pageNum, pageSize, Sort.by("date").descending());
        UUID userId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
        try {
            LocalDate startDate =  LocalDate.parse(rentPaymentsRequest.startDate());
            LocalDate endDate =  LocalDate.parse(rentPaymentsRequest.endDate());
            return ResponseEntity.ok(VariableFeeMapper.toRentVariableFeesResponse(variableFeeService.getRentVariableFees(id, userId, startDate, endDate, pageable)));
        }catch (DateTimeParseException exception) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    RentExceptionMessages.DATE_PARSING_ERROR,
                    new DateParsingException(RentExceptionMessages.DATE_PARSING_ERROR, exception, ErrorCodes.DATE_PARSING_ERROR));
        }

    }

    @PatchMapping("/locals/{id}/leave")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<LeaveLocalResponse> leaveLocal(@PathVariable UUID id) {
        try{
             UUID userId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
             localService.leaveLocal(userId, id);
             return ResponseEntity.ok(new LeaveLocalResponse(true));
        } catch (NotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage(), e);
        } catch (InvalidLocalState e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage(), e);
        }
    }

    @PatchMapping("/locals/{id}/fixed-fee")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<GetOwnLocalsResponse> setFixedFee(@PathVariable UUID id, @RequestBody @Valid SetFixedFeeRequest setFixedFeeRequest) throws NotFoundException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Jwt jwt = (Jwt) authentication.getPrincipal();
        UUID ownerId = UUID.fromString(jwt.getSubject());
        Local local = localService.setFixedFee(id, ownerId, setFixedFeeRequest.marginFee(), setFixedFeeRequest.rentalFee());
        return ResponseEntity.ok(LocalMapper.toGetOwnLocalsResponse(local));
    }

    @PatchMapping("/rents/{id}/end-date")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<RentForOwnerResponse> editEndDate(@PathVariable UUID id, @RequestBody SetEndDateRequest setEndDateRequest) {
        try {
            UUID userId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
            LocalDate newDate =  LocalDate.parse(setEndDateRequest.newEndDate());
            return ResponseEntity.ok(RentMapper.rentForOwnerResponse(rentService.editEndDate(id, userId, newDate)));
        } catch (DateTimeParseException exception) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, RentExceptionMessages.WRONG_DATE_FORMAT, new WrongEndDateException(RentExceptionMessages.WRONG_DATE_FORMAT, ErrorCodes.WRONG_END_DATE));
        } catch (NotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage(), e);
        } catch (WrongEndDateException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage(), e);
        }
    }

    @GetMapping("/locals/reports")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<List<LocalReportResponse>> getAllReports() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @GetMapping("/owner/rents/{id}")
    @PreAuthorize("hasRole('OWNER')")
    public ResponseEntity<RentForOwnerResponse> getOwnerRent(@PathVariable UUID id) {
        try {
            UUID userId = UUID.fromString(((Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSubject());
            return ResponseEntity.ok(RentMapper.rentForOwnerResponse(rentService.getOwnerRent(userId, id)));
        } catch (NotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage(), e);
        }
    }
}

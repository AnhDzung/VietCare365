package com.medicore.module.invoice.service;

import com.medicore.module.invoice.dto.InvoiceResponse;
import com.medicore.module.invoice.entity.Invoice;
import com.medicore.module.invoice.repository.InvoiceRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class InvoiceServiceImpl implements InvoiceService {

    private final InvoiceRepository invoiceRepository;

    public InvoiceServiceImpl(InvoiceRepository invoiceRepository) {
        this.invoiceRepository = invoiceRepository;
    }

    @Override
    public Page<InvoiceResponse> getAll(Pageable pageable) {
        return invoiceRepository.findAllActive(pageable)
                .map(this::toResponse);
    }

    @Override
    public Page<InvoiceResponse> search(String keyword, Pageable pageable) {
        return invoiceRepository.search(keyword, pageable)
                .map(this::toResponse);
    }

    private InvoiceResponse toResponse(Invoice invoice) {
        InvoiceResponse response = new InvoiceResponse();
        response.setId(invoice.getId());
        response.setPatientId(invoice.getPatientId());
        response.setAppointmentId(invoice.getAppointmentId());
        response.setTotalAmount(invoice.getTotalAmount());
        response.setInsuranceCoverage(invoice.getInsuranceCoverage());
        response.setPaidAmount(invoice.getPaidAmount());
        response.setStatus(invoice.getStatus() == null ? null : invoice.getStatus().name());
        response.setCreatedAt(invoice.getCreatedAt());
        response.setUpdatedAt(invoice.getUpdatedAt());
        response.setCreatedBy(invoice.getCreatedBy());
        response.setUpdatedBy(invoice.getUpdatedBy());
        return response;
    }
}
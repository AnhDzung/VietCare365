package com.medicore.module.invoice.service;

import com.medicore.module.invoice.dto.InvoiceResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface InvoiceService {

    Page<InvoiceResponse> getAll(Pageable pageable);

    Page<InvoiceResponse> search(String keyword, Pageable pageable);
}
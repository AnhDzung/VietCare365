package com.medicore.module.invoice.controller;

import com.medicore.module.invoice.dto.InvoiceResponse;
import com.medicore.module.invoice.service.InvoiceService;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/invoices")
public class InvoiceController {

    private final InvoiceService invoiceService;

    public InvoiceController(InvoiceService invoiceService) {
        this.invoiceService = invoiceService;
    }

    @GetMapping
    public String list(
            @RequestParam(required = false) String keyword,
            @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            Model model) {

        org.springframework.data.domain.Page<InvoiceResponse> invoices;
        if (keyword != null && !keyword.isBlank()) {
            invoices = invoiceService.search(keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            invoices = invoiceService.getAll(pageable);
        }

        model.addAttribute("invoices", invoices);
        model.addAttribute("page", invoices.getNumber());
        model.addAttribute("totalPages", invoices.getTotalPages());

        return "invoice/list";
    }
}

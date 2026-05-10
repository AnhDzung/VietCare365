package com.medicore.module.prescription.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequestMapping("/prescriptions")
public class PrescriptionController {
    private final com.medicore.module.prescription.service.PrescriptionService prescriptionService;

    public PrescriptionController(com.medicore.module.prescription.service.PrescriptionService prescriptionService) {
        this.prescriptionService = prescriptionService;
    }

    @GetMapping
    public String list(@PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable, org.springframework.ui.Model model) {
        model.addAttribute("page", prescriptionService.findAll(pageable));
        return "prescription/list";
    }

    @GetMapping("/create")
    public String createForm(org.springframework.ui.Model model) {
        model.addAttribute("prescription", new com.medicore.module.prescription.dto.PrescriptionDto());
        return "prescription/form";
    }

    @PostMapping("/save")
    public String save(com.medicore.module.prescription.dto.PrescriptionDto dto) {
        prescriptionService.save(dto);
        return "redirect:/prescriptions";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        prescriptionService.delete(id);
        return "redirect:/prescriptions";
    }
}

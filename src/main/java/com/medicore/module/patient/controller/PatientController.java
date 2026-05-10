package com.medicore.module.patient.controller;

import com.medicore.module.patient.dto.PatientRequest;
import com.medicore.module.patient.dto.PatientResponse;
import com.medicore.module.patient.service.PatientService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/patients")
public class PatientController {

    private final PatientService patientService;

    public PatientController(PatientService patientService) {
        this.patientService = patientService;
    }

    @GetMapping
    public String list(
            @RequestParam(required = false) String keyword,
            @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            Model model) {
        
        Page<PatientResponse> patients;
        if (keyword != null && !keyword.isEmpty()) {
            patients = patientService.search(keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            patients = patientService.getAll(pageable);
        }
        
        model.addAttribute("patients", patients);
        model.addAttribute("page", patients.getNumber());
        model.addAttribute("totalPages", patients.getTotalPages());
        
        return "patient/list";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable String id, Model model) {
        PatientResponse patient = patientService.getById(id);
        model.addAttribute("patient", patient);
        return "patient/detail";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("patient", new PatientRequest());
        return "patient/form";
    }

    @PostMapping
    public String create(@Valid PatientRequest request) {
        patientService.create(request);
        return "redirect:/patients";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable String id, Model model) {
        PatientResponse patient = patientService.getById(id);
        model.addAttribute("patient", patient);
        return "patient/form";
    }

    @PostMapping("/{id}/update")
    public String update(@PathVariable String id, @Valid PatientRequest request) {
        patientService.update(id, request);
        return "redirect:/patients/" + id;
    }

    @GetMapping("/{id}/delete")
    @PreAuthorize("hasRole('ADMIN')")
    public String delete(@PathVariable String id) {
        patientService.delete(id);
        return "redirect:/patients";
    }
}

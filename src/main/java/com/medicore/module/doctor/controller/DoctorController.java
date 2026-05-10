package com.medicore.module.doctor.controller;

import com.medicore.module.doctor.dto.DoctorRequest;
import com.medicore.module.doctor.dto.DoctorResponse;
import com.medicore.module.doctor.service.DoctorService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.access.prepost.PreAuthorize;

@Controller
@RequestMapping("/doctors")
public class DoctorController {

    private final DoctorService doctorService;

    public DoctorController(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    @GetMapping
    public String list(
            @RequestParam(required = false) String keyword,
            @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            Model model) {

        Page<DoctorResponse> doctors;
        if (keyword != null && !keyword.isBlank()) {
            doctors = doctorService.search(keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            doctors = doctorService.getAll(pageable);
        }

        model.addAttribute("doctors", doctors);
        model.addAttribute("page", doctors.getNumber());
        model.addAttribute("totalPages", doctors.getTotalPages());

        return "doctor/list";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable String id, Model model) {
        DoctorResponse doctor = doctorService.getById(id);
        model.addAttribute("doctor", doctor);
        return "doctor/detail";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("doctor", new DoctorRequest());
        return "doctor/form";
    }

    @PostMapping
    public String create(@Valid DoctorRequest request) {
        doctorService.create(request);
        return "redirect:/doctors";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable String id, Model model) {
        DoctorResponse doctor = doctorService.getById(id);
        DoctorRequest request = new DoctorRequest();
        request.setUserId(doctor.getUserId());
        request.setFullName(doctor.getFullName());
        request.setSpecialization(doctor.getSpecialization());
        request.setLicenseNumber(doctor.getLicenseNumber());
        request.setPhone(doctor.getPhone());
        request.setEmail(doctor.getEmail());

        model.addAttribute("doctor", request);
        model.addAttribute("doctorId", id);
        return "doctor/form";
    }

    @PostMapping("/{id}/update")
    public String update(@PathVariable String id, @Valid DoctorRequest request) {
        doctorService.update(id, request);
        return "redirect:/doctors/" + id;
    }

    @GetMapping("/{id}/delete")
    @PreAuthorize("hasRole('ADMIN')")
    public String delete(@PathVariable String id) {
        doctorService.delete(id);
        return "redirect:/doctors";
    }
}

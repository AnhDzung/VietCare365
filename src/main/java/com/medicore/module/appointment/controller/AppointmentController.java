package com.medicore.module.appointment.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.medicore.module.appointment.entity.Appointment;
import com.medicore.module.appointment.service.AppointmentService;

import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/appointments")
public class AppointmentController {

    private final AppointmentService appointmentService;

    @Autowired
    public AppointmentController(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    @GetMapping
    public String list(@PageableDefault(size = 10, sort = "scheduledAt", direction = Sort.Direction.DESC) Pageable pageable,
                       Model model) {
        var page = appointmentService.findAll(pageable);
        model.addAttribute("appointments", page.getContent());
        model.addAttribute("page", page);
        return "appointment/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("appointment", new Appointment());
        return "appointment/form";
    }

    @PostMapping
    public String create(@ModelAttribute Appointment appointment, @RequestParam(required = false) String scheduledAtStr) {
        if (scheduledAtStr != null && !scheduledAtStr.isEmpty()) {
            try {
                appointment.setScheduledAt(LocalDateTime.parse(scheduledAtStr));
            } catch (Exception ignored) {
            }
        }
        appointmentService.save(appointment);
        return "redirect:/appointments";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable String id) {
        appointmentService.deleteById(id);
        return "redirect:/appointments";
    }
}

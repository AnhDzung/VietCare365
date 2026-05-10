package com.medicore.module.prescription.controller;

import com.medicore.module.prescription.dto.PrescriptionDto;
import com.medicore.module.prescription.service.PrescriptionService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/prescriptions")
public class PrescriptionRestController {

    private final PrescriptionService service;

    public PrescriptionRestController(PrescriptionService service) {
        this.service = service;
    }

    @GetMapping
    public Page<?> list(Pageable pageable) {
        return service.findAll(pageable);
    }

    @GetMapping("/{id}")
    public PrescriptionDto get(@PathVariable String id) {
        return service.findById(id);
    }

    @PostMapping
    public PrescriptionDto create(@RequestBody PrescriptionDto dto) {
        return service.save(dto);
    }

    @PutMapping("/{id}")
    public PrescriptionDto update(@PathVariable String id, @RequestBody PrescriptionDto dto) {
        dto.setId(id);
        return service.save(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        service.delete(id);
    }
}

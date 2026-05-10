package com.medicore.module.medicine.controller;

import com.medicore.module.medicine.dto.MedicineDto;
import com.medicore.module.medicine.service.MedicineService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/medicines")
public class MedicineRestController {

    private final MedicineService service;

    public MedicineRestController(MedicineService service) {
        this.service = service;
    }

    @GetMapping
    public Page<MedicineDto> list(Pageable pageable) {
        return service.findAll(pageable);
    }

    @GetMapping("/{id}")
    public MedicineDto get(@PathVariable String id) {
        return service.findById(id);
    }

    @PostMapping
    public MedicineDto create(@RequestBody MedicineDto dto) {
        return service.save(dto);
    }

    @PutMapping("/{id}")
    public MedicineDto update(@PathVariable String id, @RequestBody MedicineDto dto) {
        dto.setId(id);
        return service.save(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        service.delete(id);
    }
}

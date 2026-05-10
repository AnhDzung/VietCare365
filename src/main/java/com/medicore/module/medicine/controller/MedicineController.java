package com.medicore.module.medicine.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/medicines")
public class MedicineController {

    private final com.medicore.module.medicine.service.MedicineService medicineService;

    public MedicineController(com.medicore.module.medicine.service.MedicineService medicineService) {
        this.medicineService = medicineService;
    }

    @GetMapping
    public String list(@PageableDefault(size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable, Model model) {
        model.addAttribute("page", medicineService.findAll(pageable));
        return "medicine/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("medicine", new com.medicore.module.medicine.dto.MedicineDto());
        return "medicine/form";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable String id, Model model) {
        com.medicore.module.medicine.dto.MedicineDto dto = medicineService.findById(id);
        model.addAttribute("medicine", dto != null ? dto : new com.medicore.module.medicine.dto.MedicineDto());
        return "medicine/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("medicine") com.medicore.module.medicine.dto.MedicineDto dto) {
        medicineService.save(dto);
        return "redirect:/medicines";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        medicineService.delete(id);
        return "redirect:/medicines";
    }
}

package com.medicore.module.prescription.service;

import com.medicore.module.prescription.dto.PrescriptionDto;
import com.medicore.module.prescription.entity.Prescription;
import com.medicore.module.prescription.entity.PrescriptionItem;
import com.medicore.module.prescription.mapper.PrescriptionMapper;
import com.medicore.module.prescription.repository.PrescriptionItemRepository;
import com.medicore.module.prescription.repository.PrescriptionRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrescriptionService {

    private final PrescriptionRepository prescriptionRepository;
    private final PrescriptionItemRepository itemRepository;

    public PrescriptionService(PrescriptionRepository prescriptionRepository, PrescriptionItemRepository itemRepository) {
        this.prescriptionRepository = prescriptionRepository;
        this.itemRepository = itemRepository;
    }

    public Page<Prescription> findAll(Pageable pageable) {
        return prescriptionRepository.findAll(pageable);
    }

    public PrescriptionDto findById(String id) {
        Prescription p = prescriptionRepository.findById(id).orElse(null);
        List<PrescriptionItem> items = itemRepository.findAll();
        return PrescriptionMapper.toDto(p, items.stream().filter(it -> it.getPrescriptionId().equals(id)).toList());
    }

    public PrescriptionDto save(PrescriptionDto dto) {
        Prescription p = PrescriptionMapper.toEntity(dto);
        Prescription saved = prescriptionRepository.save(p);
        // save items
        if (dto.getItems() != null) {
            dto.getItems().forEach(i -> {
                PrescriptionItem it = PrescriptionMapper.toItemEntity(i);
                it.setPrescriptionId(saved.getId());
                itemRepository.save(it);
            });
        }
        return PrescriptionMapper.toDto(saved, itemRepository.findAll().stream().filter(it -> it.getPrescriptionId().equals(saved.getId())).toList());
    }

    public void delete(String id) {
        // delete items first
        itemRepository.findAll().stream().filter(it -> it.getPrescriptionId().equals(id)).forEach(it -> itemRepository.deleteById(it.getId()));
        prescriptionRepository.deleteById(id);
    }
}

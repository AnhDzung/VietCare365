package com.medicore.module.medicine.service;

import com.medicore.module.medicine.dto.MedicineDto;
import com.medicore.module.medicine.entity.Medicine;
import com.medicore.module.medicine.mapper.MedicineMapper;
import com.medicore.module.medicine.repository.MedicineRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MedicineService {

    private final MedicineRepository repository;

    public MedicineService(MedicineRepository repository) {
        this.repository = repository;
    }

    public Page<MedicineDto> findAll(Pageable pageable) {
        return repository.findAll(pageable).map(MedicineMapper::toDto);
    }

    public MedicineDto findById(String id) {
        return repository.findById(id).map(MedicineMapper::toDto).orElse(null);
    }

    public MedicineDto save(MedicineDto dto) {
        Medicine entity = MedicineMapper.toEntity(dto);
        Medicine saved = repository.save(entity);
        return MedicineMapper.toDto(saved);
    }

    public void delete(String id) {
        repository.deleteById(id);
    }
}

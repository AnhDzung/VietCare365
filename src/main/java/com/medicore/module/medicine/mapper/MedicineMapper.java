package com.medicore.module.medicine.mapper;

import com.medicore.module.medicine.dto.MedicineDto;
import com.medicore.module.medicine.entity.Medicine;

public final class MedicineMapper {

    private MedicineMapper() {}

    public static MedicineDto toDto(Medicine m) {
        if (m == null) return null;
        MedicineDto dto = new MedicineDto();
        dto.setId(m.getId());
        dto.setName(m.getName());
        dto.setUnit(m.getUnit());
        dto.setPrice(m.getPrice());
        dto.setStockQuantity(m.getStockQuantity());
        dto.setDescription(m.getDescription());
        return dto;
    }

    public static Medicine toEntity(MedicineDto dto) {
        if (dto == null) return null;
        Medicine m = new Medicine();
        m.setId(dto.getId());
        m.setName(dto.getName());
        m.setUnit(dto.getUnit());
        m.setPrice(dto.getPrice());
        m.setStockQuantity(dto.getStockQuantity() == null ? 0 : dto.getStockQuantity());
        m.setDescription(dto.getDescription());
        return m;
    }
}

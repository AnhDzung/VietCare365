package com.medicore.module.prescription.mapper;

import com.medicore.module.prescription.dto.PrescriptionDto;
import com.medicore.module.prescription.dto.PrescriptionItemDto;
import com.medicore.module.prescription.entity.Prescription;
import com.medicore.module.prescription.entity.PrescriptionItem;

import java.util.List;
import java.util.stream.Collectors;

public final class PrescriptionMapper {

    private PrescriptionMapper() {}

    public static PrescriptionDto toDto(Prescription p, List<PrescriptionItem> items) {
        if (p == null) return null;
        PrescriptionDto dto = new PrescriptionDto();
        dto.setId(p.getId());
        dto.setMedicalRecordId(p.getMedicalRecordId());
        dto.setNote(p.getNote());
        if (items != null) {
            dto.setItems(items.stream().map(PrescriptionMapper::itemToDto).collect(Collectors.toList()));
        }
        return dto;
    }

    public static PrescriptionItemDto itemToDto(PrescriptionItem it) {
        if (it == null) return null;
        PrescriptionItemDto dto = new PrescriptionItemDto();
        dto.setId(it.getId());
        dto.setMedicineId(it.getMedicineId());
        dto.setDosage(it.getDosage());
        dto.setQuantity(it.getQuantity());
        dto.setInstruction(it.getInstruction());
        return dto;
    }

    public static Prescription toEntity(PrescriptionDto dto) {
        if (dto == null) return null;
        Prescription p = new Prescription();
        p.setId(dto.getId());
        p.setMedicalRecordId(dto.getMedicalRecordId());
        p.setNote(dto.getNote());
        return p;
    }

    public static PrescriptionItem toItemEntity(PrescriptionItemDto dto) {
        if (dto == null) return null;
        PrescriptionItem it = new PrescriptionItem();
        it.setId(dto.getId());
        it.setMedicineId(dto.getMedicineId());
        it.setDosage(dto.getDosage());
        it.setQuantity(dto.getQuantity());
        it.setInstruction(dto.getInstruction());
        return it;
    }
}

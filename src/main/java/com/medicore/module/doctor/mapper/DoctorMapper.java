package com.medicore.module.doctor.mapper;

import com.medicore.module.doctor.dto.DoctorRequest;
import com.medicore.module.doctor.dto.DoctorResponse;
import com.medicore.module.doctor.entity.Doctor;
import org.springframework.stereotype.Component;

@Component
public class DoctorMapper {

    public DoctorResponse toResponse(Doctor entity) {
        if (entity == null) {
            return null;
        }

        DoctorResponse response = new DoctorResponse();
        response.setId(entity.getId());
        response.setUserId(entity.getUserId());
        response.setFullName(entity.getFullName());
        response.setSpecialization(entity.getSpecialization());
        response.setLicenseNumber(entity.getLicenseNumber());
        response.setPhone(entity.getPhone());
        response.setEmail(entity.getEmail());
        response.setCreatedAt(entity.getCreatedAt());
        response.setUpdatedAt(entity.getUpdatedAt());
        response.setCreatedBy(entity.getCreatedBy());
        response.setUpdatedBy(entity.getUpdatedBy());
        return response;
    }

    public Doctor toEntity(DoctorRequest request) {
        if (request == null) {
            return null;
        }

        Doctor doctor = new Doctor();
        updateEntity(request, doctor);
        return doctor;
    }

    public void updateEntity(DoctorRequest request, Doctor entity) {
        if (request == null || entity == null) {
            return;
        }

        entity.setUserId(request.getUserId());
        entity.setFullName(request.getFullName());
        entity.setSpecialization(request.getSpecialization());
        entity.setLicenseNumber(request.getLicenseNumber());
        entity.setPhone(request.getPhone());
        entity.setEmail(request.getEmail());
    }
}

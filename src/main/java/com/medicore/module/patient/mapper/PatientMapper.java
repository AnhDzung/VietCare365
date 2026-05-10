package com.medicore.module.patient.mapper;

import com.medicore.module.patient.dto.PatientRequest;
import com.medicore.module.patient.dto.PatientResponse;
import com.medicore.module.patient.entity.Patient;
import org.springframework.stereotype.Component;

@Component
public class PatientMapper {

    public PatientResponse toResponse(Patient entity) {
        if (entity == null) {
            return null;
        }

        PatientResponse response = new PatientResponse();
        response.setId(entity.getId());
        response.setFullName(entity.getFullName());
        response.setDateOfBirth(entity.getDateOfBirth());
        response.setGender(entity.getGender() != null ? entity.getGender().name() : null);
        response.setPhone(entity.getPhone());
        response.setAddress(entity.getAddress());
        response.setEmail(entity.getEmail());
        response.setUserId(entity.getUserId());
        response.setInsuranceNumber(entity.getInsuranceNumber());
        response.setBloodType(entity.getBloodType());
        response.setCreatedAt(entity.getCreatedAt());
        response.setUpdatedAt(entity.getUpdatedAt());
        response.setCreatedBy(entity.getCreatedBy());
        return response;
    }

    public Patient toEntity(PatientRequest request) {
        if (request == null) {
            return null;
        }

        Patient patient = new Patient();
        updateEntity(request, patient);
        return patient;
    }

    public void updateEntity(PatientRequest request, Patient entity) {
        if (request == null || entity == null) {
            return;
        }

        entity.setFullName(request.getFullName());
        entity.setDateOfBirth(request.getDateOfBirth());
        entity.setGender(parseGender(request.getGender()));
        entity.setPhone(request.getPhone());
        entity.setAddress(request.getAddress());
        entity.setEmail(request.getEmail());
        entity.setInsuranceNumber(request.getInsuranceNumber());
        entity.setBloodType(request.getBloodType());
    }

    private Patient.Gender parseGender(String gender) {
        if (gender == null || gender.isBlank()) {
            return null;
        }

        try {
            return Patient.Gender.valueOf(gender.trim().toUpperCase());
        } catch (IllegalArgumentException ex) {
            return null;
        }
    }
}

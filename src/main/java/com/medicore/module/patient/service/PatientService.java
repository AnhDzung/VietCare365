package com.medicore.module.patient.service;

import com.medicore.module.patient.dto.PatientRequest;
import com.medicore.module.patient.dto.PatientResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PatientService {

    PatientResponse create(PatientRequest request);

    PatientResponse update(String id, PatientRequest request);

    PatientResponse getById(String id);

    Page<PatientResponse> getAll(Pageable pageable);

    Page<PatientResponse> search(String keyword, Pageable pageable);

    void delete(String id);
}

package com.medicore.module.doctor.service;

import com.medicore.module.doctor.dto.DoctorRequest;
import com.medicore.module.doctor.dto.DoctorResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface DoctorService {

    DoctorResponse create(DoctorRequest request);

    DoctorResponse update(String id, DoctorRequest request);

    DoctorResponse getById(String id);

    Page<DoctorResponse> getAll(Pageable pageable);

    Page<DoctorResponse> search(String keyword, Pageable pageable);

    void delete(String id);
}
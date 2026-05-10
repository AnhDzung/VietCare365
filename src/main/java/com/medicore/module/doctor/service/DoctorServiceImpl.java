package com.medicore.module.doctor.service;

import com.medicore.common.exception.AppException;
import com.medicore.common.exception.ErrorCode;
import com.medicore.module.doctor.dto.DoctorRequest;
import com.medicore.module.doctor.dto.DoctorResponse;
import com.medicore.module.doctor.entity.Doctor;
import com.medicore.module.doctor.mapper.DoctorMapper;
import com.medicore.module.doctor.repository.DoctorRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DoctorServiceImpl implements DoctorService {

    private final DoctorRepository doctorRepository;
    private final DoctorMapper doctorMapper;

    public DoctorServiceImpl(DoctorRepository doctorRepository, DoctorMapper doctorMapper) {
        this.doctorRepository = doctorRepository;
        this.doctorMapper = doctorMapper;
    }

    @Override
    public DoctorResponse create(DoctorRequest request) {
        Doctor doctor = doctorMapper.toEntity(request);
        Doctor saved = doctorRepository.save(doctor);
        return doctorMapper.toResponse(saved);
    }

    @Override
    public DoctorResponse update(String id, DoctorRequest request) {
        Doctor doctor = doctorRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DOCTOR_NOT_FOUND));

        if (doctor.getDeleted()) {
            throw new AppException(ErrorCode.DOCTOR_NOT_FOUND);
        }

        doctorMapper.updateEntity(request, doctor);
        Doctor updated = doctorRepository.save(doctor);
        return doctorMapper.toResponse(updated);
    }

    @Override
    public DoctorResponse getById(String id) {
        Doctor doctor = doctorRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DOCTOR_NOT_FOUND));

        if (doctor.getDeleted()) {
            throw new AppException(ErrorCode.DOCTOR_NOT_FOUND);
        }

        return doctorMapper.toResponse(doctor);
    }

    @Override
    public Page<DoctorResponse> getAll(Pageable pageable) {
        return doctorRepository.findAllActive(pageable)
                .map(doctorMapper::toResponse);
    }

    @Override
    public Page<DoctorResponse> search(String keyword, Pageable pageable) {
        return doctorRepository.search(keyword, pageable)
                .map(doctorMapper::toResponse);
    }

    @Override
    public void delete(String id) {
        Doctor doctor = doctorRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DOCTOR_NOT_FOUND));

        doctor.setDeleted(true);
        doctorRepository.save(doctor);
    }
}
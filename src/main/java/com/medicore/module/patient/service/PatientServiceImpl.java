package com.medicore.module.patient.service;

import com.medicore.common.exception.AppException;
import com.medicore.common.exception.ErrorCode;
import com.medicore.module.patient.dto.PatientRequest;
import com.medicore.module.patient.dto.PatientResponse;
import com.medicore.module.patient.entity.Patient;
import com.medicore.module.patient.mapper.PatientMapper;
import com.medicore.module.patient.repository.PatientRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PatientServiceImpl implements PatientService {

    private final PatientRepository patientRepository;
    private final PatientMapper patientMapper;

    public PatientServiceImpl(PatientRepository patientRepository, PatientMapper patientMapper) {
        this.patientRepository = patientRepository;
        this.patientMapper = patientMapper;
    }

    @Override
    public PatientResponse create(PatientRequest request) {
        Patient patient = patientMapper.toEntity(request);
        Patient saved = patientRepository.save(patient);
        return patientMapper.toResponse(saved);
    }

    @Override
    public PatientResponse update(String id, PatientRequest request) {
        Patient patient = patientRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PATIENT_NOT_FOUND));
        
        if (patient.getDeleted()) {
            throw new AppException(ErrorCode.PATIENT_NOT_FOUND);
        }

        patientMapper.updateEntity(request, patient);
        Patient updated = patientRepository.save(patient);
        return patientMapper.toResponse(updated);
    }

    @Override
    public PatientResponse getById(String id) {
        Patient patient = patientRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PATIENT_NOT_FOUND));
        
        if (patient.getDeleted()) {
            throw new AppException(ErrorCode.PATIENT_NOT_FOUND);
        }

        return patientMapper.toResponse(patient);
    }

    @Override
    public Page<PatientResponse> getAll(Pageable pageable) {
        return patientRepository.findAllActive(pageable)
                .map(patientMapper::toResponse);
    }

    @Override
    public Page<PatientResponse> search(String keyword, Pageable pageable) {
        return patientRepository.searchByFullName(keyword, pageable)
                .map(patientMapper::toResponse);
    }

    @Override
    public void delete(String id) {
        Patient patient = patientRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PATIENT_NOT_FOUND));
        
        patient.setDeleted(true);
        patientRepository.save(patient);
    }
}

package com.medicore.module.patient.repository;

import com.medicore.module.patient.entity.Patient;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PatientRepository extends JpaRepository<Patient, String> {

    @Query("SELECT p FROM Patient p WHERE p.deleted = false AND p.fullName LIKE %:keyword%")
    Page<Patient> searchByFullName(String keyword, Pageable pageable);

    @Query("SELECT p FROM Patient p WHERE p.deleted = false AND p.phone = :phone")
    Optional<Patient> findByPhone(String phone);

    @Query("SELECT p FROM Patient p WHERE p.deleted = false")
    Page<Patient> findAllActive(Pageable pageable);
}

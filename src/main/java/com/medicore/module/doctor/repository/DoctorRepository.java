package com.medicore.module.doctor.repository;

import com.medicore.module.doctor.entity.Doctor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, String> {

	@Query("SELECT d FROM Doctor d WHERE d.deleted = false AND (" +
			"LOWER(d.fullName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
			"LOWER(COALESCE(d.specialization, '')) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
			"LOWER(COALESCE(d.licenseNumber, '')) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
			"LOWER(COALESCE(d.phone, '')) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
			"LOWER(COALESCE(d.email, '')) LIKE LOWER(CONCAT('%', :keyword, '%')))")
	Page<Doctor> search(String keyword, Pageable pageable);

	@Query("SELECT d FROM Doctor d WHERE d.deleted = false")
	Page<Doctor> findAllActive(Pageable pageable);

	Optional<Doctor> findByLicenseNumber(String licenseNumber);
}

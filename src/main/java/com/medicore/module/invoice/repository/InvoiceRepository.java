package com.medicore.module.invoice.repository;

import com.medicore.module.invoice.entity.Invoice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, String> {

	@Query("SELECT i FROM Invoice i WHERE i.deleted = false AND (" +
			"LOWER(i.patientId) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
			"LOWER(COALESCE(i.appointmentId, '')) LIKE LOWER(CONCAT('%', :keyword, '%')))")
	Page<Invoice> search(String keyword, Pageable pageable);

	@Query("SELECT i FROM Invoice i WHERE i.deleted = false")
	Page<Invoice> findAllActive(Pageable pageable);
}

package com.medicore.module.appointment.service;

import com.medicore.module.appointment.entity.Appointment;
import com.medicore.module.appointment.repository.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AppointmentService {

    private final AppointmentRepository repository;

    @Autowired
    public AppointmentService(AppointmentRepository repository) {
        this.repository = repository;
    }

    public Page<Appointment> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public Optional<Appointment> findById(String id) {
        return repository.findById(id);
    }

    public Appointment save(Appointment appointment) {
        return repository.save(appointment);
    }

    public void deleteById(String id) {
        repository.deleteById(id);
    }
}

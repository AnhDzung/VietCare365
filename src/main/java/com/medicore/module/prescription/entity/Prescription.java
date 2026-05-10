package com.medicore.module.prescription.entity;

import com.medicore.common.base.BaseEntity;
import jakarta.persistence.*;

@Entity
@Table(name = "prescriptions")
public class Prescription extends BaseEntity {

    @Column(nullable = false)
    private String medicalRecordId;

    private String note;

    public Prescription() {
    }

    public String getMedicalRecordId() {
        return medicalRecordId;
    }

    public void setMedicalRecordId(String medicalRecordId) {
        this.medicalRecordId = medicalRecordId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}

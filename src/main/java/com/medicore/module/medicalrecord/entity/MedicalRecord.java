package com.medicore.module.medicalrecord.entity;

import com.medicore.common.base.BaseEntity;
import jakarta.persistence.*;

@Entity
@Table(name = "medical_records")
public class MedicalRecord extends BaseEntity {

    @Column(nullable = false)
    private String appointmentId;

    private String diagnosis;

    @Column(name = "icd10_code")
    private String icd10Code;

    private String symptoms;

    private String note;

    public MedicalRecord() {
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getIcd10Code() {
        return icd10Code;
    }

    public void setIcd10Code(String icd10Code) {
        this.icd10Code = icd10Code;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}

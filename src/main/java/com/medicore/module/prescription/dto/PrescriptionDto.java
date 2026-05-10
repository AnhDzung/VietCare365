package com.medicore.module.prescription.dto;

import java.util.ArrayList;
import java.util.List;

public class PrescriptionDto {

    private String id;
    private String medicalRecordId;
    private String note;
    private List<PrescriptionItemDto> items = new ArrayList<>();

    public PrescriptionDto() {}

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getMedicalRecordId() { return medicalRecordId; }
    public void setMedicalRecordId(String medicalRecordId) { this.medicalRecordId = medicalRecordId; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public List<PrescriptionItemDto> getItems() { return items; }
    public void setItems(List<PrescriptionItemDto> items) { this.items = items; }
}

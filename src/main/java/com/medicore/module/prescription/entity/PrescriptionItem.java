package com.medicore.module.prescription.entity;

import com.medicore.common.base.BaseEntity;
import jakarta.persistence.*;

@Entity
@Table(name = "prescription_items")
public class PrescriptionItem extends BaseEntity {

    @Column(nullable = false)
    private String prescriptionId;

    @Column(nullable = false)
    private String medicineId;

    private String dosage;

    private Integer quantity;

    private String instruction;

    public PrescriptionItem() {
    }

    public String getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(String prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(String medicineId) {
        this.medicineId = medicineId;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }
}

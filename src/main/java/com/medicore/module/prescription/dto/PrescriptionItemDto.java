package com.medicore.module.prescription.dto;

public class PrescriptionItemDto {

    private String id;
    private String medicineId;
    private String dosage;
    private Integer quantity;
    private String instruction;

    public PrescriptionItemDto() {}

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getMedicineId() { return medicineId; }
    public void setMedicineId(String medicineId) { this.medicineId = medicineId; }
    public String getDosage() { return dosage; }
    public void setDosage(String dosage) { this.dosage = dosage; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public String getInstruction() { return instruction; }
    public void setInstruction(String instruction) { this.instruction = instruction; }
}

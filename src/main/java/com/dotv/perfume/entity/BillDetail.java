package com.dotv.perfume.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "bill_detail")
public class BillDetail {

    @EmbeddedId
    private BillId id;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "currently_price")
    private BigDecimal currentlyPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("idBill")
    @JoinColumn(name = "id_bill")
    @JsonIgnore
    private Bill bill;

    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("idProduct")
    @JoinColumn(name = "id_product")
    private Product product;

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public BillId getId() {
        return id;
    }

    public void setId(BillId id) {
        this.id = id;
    }

    public Integer getAmount() {
        return this.amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public BigDecimal getCurrentlyPrice() {
        return this.currentlyPrice;
    }

    public void setCurrentlyPrice(BigDecimal currentlyPrice) {
        this.currentlyPrice = currentlyPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BillDetail)) return false;
        BillDetail that = (BillDetail) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getAmount(), that.getAmount()) && Objects.equals(getCurrentlyPrice(), that.getCurrentlyPrice());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getAmount(), getCurrentlyPrice());
    }
}

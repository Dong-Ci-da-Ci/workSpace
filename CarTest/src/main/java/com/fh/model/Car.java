package com.fh.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Car {
    private Integer id;

    private String name;

    private Double price;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date producedDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getProducedDate() {
        return producedDate;
    }

    public void setProducedDate(Date producedDate) {
        this.producedDate = producedDate;
    }

    @Override
    public String toString() {
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        return "Car{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", producedDate=" + s.format(producedDate)+
                '}';
    }
}

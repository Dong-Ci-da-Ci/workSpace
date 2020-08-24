package com.fh.model;

import javax.persistence.*;

@Entity
@Table(name = "t_winterWorkCarBrand")
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer  brandId ;//品牌id
    private String  brandName ;//品牌名称

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}

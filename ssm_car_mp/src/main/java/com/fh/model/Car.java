package com.fh.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Car {
    private Integer carId; //汽车编号
    private String carName;// 汽车名称
    private Double carPrice;// 汽车价格
    private Integer isup;// 是否上市，1是，2否
    private String configure;// 汽车配置(1一键启动,2座椅加热,3车感平衡,4全景天窗)
    private String introduction;// 汽车简介
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date producedDate;// 出厂日期
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateDate;// 修改日期

    private Integer  brandId ;//品牌id
    private String  brandName ;//品牌名称

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public Double getCarPrice() {
        return carPrice;
    }

    public void setCarPrice(Double carPrice) {
        this.carPrice = carPrice;
    }

    public Integer getIsup() {
        return isup;
    }

    public void setIsup(Integer isup) {
        this.isup = isup;
    }

    public String getConfigure() {
        return configure;
    }

    public void setConfigure(String configure) {
        this.configure = configure;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getProducedDate() {
        return producedDate;
    }

    public void setProducedDate(Date producedDate) {
        this.producedDate = producedDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

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

package com.fh.model.vo;

import java.math.BigDecimal;

/**
 * 商品表
 */
public class Product {

    private Integer id;

    private String name;    //商品名称

    private String title;   //标题

    //private Integer brandId;   //

    private Integer isHot;

    private Integer status;  //状态

    private BigDecimal price;

    private Integer classifyId1;

    private Integer classifyId2;

    private Integer classifyId3;

    private  String remark; // 评论

    private String  mainImage;


    //private String  brandName ;//品牌名称

//    public String getBrandName() {
//        return brandName;
//    }
//
//    public void setBrandName(String brandName) {
//        this.brandName = brandName;
//    }

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

//    public Integer getBrandId() {
//        return brandId;
//    }
//
//    public void setBrandId(Integer brandId) {
//        this.brandId = brandId;
//    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getClassifyId1() {
        return classifyId1;
    }

    public void setClassifyId1(Integer classifyId1) {
        this.classifyId1 = classifyId1;
    }

    public Integer getClassifyId2() {
        return classifyId2;
    }

    public void setClassifyId2(Integer classifyId2) {
        this.classifyId2 = classifyId2;
    }

    public Integer getClassifyId3() {
        return classifyId3;
    }

    public void setClassifyId3(Integer classifyId3) {
        this.classifyId3 = classifyId3;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", isHot=" + isHot +
                ", status=" + status +
                ", price=" + price +
                ", classifyId1=" + classifyId1 +
                ", classifyId2=" + classifyId2 +
                ", classifyId3=" + classifyId3 +
                ", remark='" + remark + '\'' +
                ", mainImage='" + mainImage + '\'' +
                '}';
    }
}

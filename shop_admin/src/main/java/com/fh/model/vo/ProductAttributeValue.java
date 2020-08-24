package com.fh.model.vo;

/**
 * 商品的属性值表
 */
public class ProductAttributeValue {

    private Integer id;

    private Integer attributeId; // 属性id

    private Integer valueId; // 属性值id‘

    private Integer productId; // 商品id

    private Integer isSku;  // 是否热销产品

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(Integer attributeId) {
        this.attributeId = attributeId;
    }

    public Integer getValueId() {
        return valueId;
    }

    public void setValueId(Integer valueId) {
        this.valueId = valueId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getIsSku() {
        return isSku;
    }

    public void setIsSku(Integer isSku) {
        this.isSku = isSku;
    }
}

package com.fh.model.vo;

import java.util.List;

public class ProductInfo {

    private Product product;

    private List<ProductAttributeValue> productAttributeValueList;

    private List<ProductSku> productSkuList;

    public List<ProductAttributeValue> getProductAttributeValueList() {
        return productAttributeValueList;
    }

    public void setProductAttributeValueList(List<ProductAttributeValue> productAttributeValueList) {
        this.productAttributeValueList = productAttributeValueList;
    }

    public List<ProductSku> getProductSkuList() {
        return productSkuList;
    }

    public void setProductSkuList(List<ProductSku> productSkuList) {
        this.productSkuList = productSkuList;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

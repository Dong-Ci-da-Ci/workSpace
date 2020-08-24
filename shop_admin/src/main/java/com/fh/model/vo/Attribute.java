package com.fh.model.vo;

/**
 * 属性表
 */
public class Attribute {

    private Integer id;

    private String name;

    private Integer type;   //1：spu属性，2：sku属性

    private Integer inputType;  //1：手动输入，2：从可选项中选择

    private Integer  selectType; //1：输入框，2：单选按钮，3：复选框；4：下拉列表

    private  Integer addAble;   // 是否允许扩展属性值 1：允许；2：不允许

    private Integer categoryId;

    private String attributeValue; // 属性值

    //用来存放属性值
    private String inputList;
    //用来存放属性值的id
    private String valueIdList;

    public String getValueIdList() {
        return valueIdList;
    }

    public void setValueIdList(String valueIdList) {
        this.valueIdList = valueIdList;
    }

    public String getInputList() {
        return inputList;
    }

    public void setInputList(String inputList) {
        this.inputList = inputList;
    }

    public String getAttributeValue() {
        return attributeValue;
    }

    public void setAttributeValue(String attributeValue) {
        this.attributeValue = attributeValue;
    }

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getInputType() {
        return inputType;
    }

    public void setInputType(Integer inputType) {
        this.inputType = inputType;
    }

    public Integer getSelectType() {
        return selectType;
    }

    public void setSelectType(Integer selectType) {
        this.selectType = selectType;
    }

    public Integer getAddAble() {
        return addAble;
    }

    public void setAddAble(Integer addAble) {
        this.addAble = addAble;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}

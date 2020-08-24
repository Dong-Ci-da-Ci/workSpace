package com.fh.model;

import com.fh.util.DataTablePageBean;
import org.springframework.format.annotation.DateTimeFormat;


import java.util.Date;
import java.util.List;

public class ConditionQuery extends DataTablePageBean {

    private String name; 			//名称

    private Double  minPrice;		//价格
    private Double maxPrice;

    private Integer  minAge;		//年龄
    private Integer maxAge;

    private Double  minWeight;		//体重
    private Double maxWeight;

    private Integer minSales;      	//销量
    private Integer maxSales;

    private Integer minStock;		//库存
    private Integer maxStock;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date  minDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")//时间
    private Date maxDate;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minCreateDate;		//创建日期

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxCreateDate;

    private List personList;

    public List getPersonList() {
        return personList;
    }

    public void setPersonList(List personList) {
        this.personList = personList;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minUpdateDate;		//修改日期

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxUpdateDate;

    private Integer sex;			//性别
    private Integer isup;			//是否上架
    private Integer status;			//状态

    private Integer grade;			//班级
    private Integer  area;			//地区
    private Integer  brand;			//品牌
    private Integer  type;			//类型

    private String  person;			//适合人群
    private String hobby;			//爱好


    private String realName;		//真实姓名
    private String username;		//用户名
    private String roleName;		//角色名

    private Integer phoneNumber;	//手机号

    private String email;			//邮箱
    private Integer num;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Integer getMinSales() {
        return minSales;
    }

    public void setMinSales(Integer minSales) {
        this.minSales = minSales;
    }

    public Integer getMaxSales() {
        return maxSales;
    }

    public void setMaxSales(Integer maxSales) {
        this.maxSales = maxSales;
    }

    public Integer getMinStock() {
        return minStock;
    }

    public void setMinStock(Integer minStock) {
        this.minStock = minStock;
    }

    public Integer getMaxStock() {
        return maxStock;
    }

    public void setMaxStock(Integer maxStock) {
        this.maxStock = maxStock;
    }


    public Date getMinDate() {
        return minDate;
    }

    public void setMinDate(Date minDate) {
        this.minDate = minDate;
    }

    public Date getMaxDate() {
        return maxDate;
    }

    public void setMaxDate(Date maxDate) {
        this.maxDate = maxDate;
    }

    public Date getMinCreateDate() {
        return minCreateDate;
    }

    public void setMinCreateDate(Date minCreateDate) {
        this.minCreateDate = minCreateDate;
    }

    public Date getMaxCreateDate() {
        return maxCreateDate;
    }

    public void setMaxCreateDate(Date maxCreateDate) {
        this.maxCreateDate = maxCreateDate;
    }

    public Date getMinUpdateDate() {
        return minUpdateDate;
    }

    public void setMinUpdateDate(Date minUpdateDate) {
        this.minUpdateDate = minUpdateDate;
    }

    public Date getMaxUpdateDate() {
        return maxUpdateDate;
    }

    public void setMaxUpdateDate(Date maxUpdateDate) {
        this.maxUpdateDate = maxUpdateDate;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getIsup() {
        return isup;
    }

    public void setIsup(Integer isup) {
        this.isup = isup;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Integer getBrand() {
        return brand;
    }

    public void setBrand(Integer brand) {
        this.brand = brand;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }


    public Integer getMinAge() {
        return minAge;
    }

    public void setMinAge(Integer minAge) {
        this.minAge = minAge;
    }

    public Integer getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(Integer maxAge) {
        this.maxAge = maxAge;
    }

    public Double getMinWeight() {
        return minWeight;
    }

    public void setMinWeight(Double minWeight) {
        this.minWeight = minWeight;
    }

    public Double getMaxWeight() {
        return maxWeight;
    }

    public void setMaxWeight(Double maxWeight) {
        this.maxWeight = maxWeight;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }










}

package com.fh.model;

import javax.persistence.*;

@Entity
@Table(name = "t_student_stu")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id			;// 学生id
    private String  name		;//	 学生名称
    private Integer age			;//	年龄
    private Integer sex			;//		性别，1男，2女
    private Double phoneNumber; // 手机号
    private String email;
    private String stuImg          ; // 头像路径
    @ManyToOne
    @JoinColumn(name = "areaId")
    private Area stuArea;// 地区;//
    @ManyToOne
    @JoinColumn(name = "gradeId")
    private Grade stuGrade		;//		 班级

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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Double getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Double phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStuImg() {
        return stuImg;
    }

    public void setStuImg(String stuImg) {
        this.stuImg = stuImg;
    }

    public Area getStuArea() {
        return stuArea;
    }

    public void setStuArea(Area stuArea) {
        this.stuArea = stuArea;
    }

    public Grade getStuGrade() {
        return stuGrade;
    }

    public void setStuGrade(Grade stuGrade) {
        this.stuGrade = stuGrade;
    }
}

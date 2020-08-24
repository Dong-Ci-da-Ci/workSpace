package com.fh.model;

import javax.persistence.*;

@Entity
@Table(name = "t_student_stuGrade")
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer gradeId ;// 地区id
    private String  gradeName ;//  地区名称

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }
}

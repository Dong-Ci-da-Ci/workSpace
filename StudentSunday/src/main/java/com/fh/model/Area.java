package com.fh.model;

import javax.persistence.*;

@Entity
@Table(name = "t_student_stuArea")
public class Area {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer areaId;
    private String areaName;

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }
}

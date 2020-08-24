package com.fh.model;

import javax.persistence.*;

@Entity
@Table(name = "t_winterWorkBookType")
public class BookType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer typeId;// 类型id
    private String typeName;//  名称

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}

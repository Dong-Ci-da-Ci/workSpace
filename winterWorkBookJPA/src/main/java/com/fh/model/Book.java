package com.fh.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_winterWorkBook")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer bookId;// 图书编号
    private String bookName;// 图书名称
    private Double bookPrice;// 图书价格
    private Integer  bookSales;// 图书销量
    private String fileName;//图片
    private Integer bookStock;// 图书库存
    private Integer isup;// 是否上架，1是，2否
    private String person;//适合人群 (1少年,2青年,3中年,4老年)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date producedDate;// 出版日期
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;// 创建时间
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateDate;// 修改时间
    @ManyToOne
    @JoinColumn(name = "typeId")
    private BookType bookTypeId;//图书类型


    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public Integer getBookSales() {
        return bookSales;
    }

    public void setBookSales(Integer bookSales) {
        this.bookSales = bookSales;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getBookStock() {
        return bookStock;
    }

    public void setBookStock(Integer bookStock) {
        this.bookStock = bookStock;
    }

    public Integer getIsup() {
        return isup;
    }

    public void setIsup(Integer isup) {
        this.isup = isup;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public Date getProducedDate() {
        return producedDate;
    }

    public void setProducedDate(Date producedDate) {
        this.producedDate = producedDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public BookType getBookTypeId() {
        return bookTypeId;
    }

    public void setBookTypeId(BookType bookTypeId) {
        this.bookTypeId = bookTypeId;
    }
}

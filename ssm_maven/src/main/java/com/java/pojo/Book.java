package com.java.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book implements Serializable {
    private static final long serialVersionUID = 9210970764755747341L;
    private Integer book_id;
    private String book_name;

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_detail() {
        return book_detail;
    }

    public void setBook_detail(String book_detail) {
        this.book_detail = book_detail;
    }

    public String getBook_publisher() {
        return book_publisher;
    }

    public void setBook_publisher(String book_publisher) {
        this.book_publisher = book_publisher;
    }

    public Date getBook_pub_time() {
        return book_pub_time;
    }

    public void setBook_pub_time(Date book_pub_time) {
        this.book_pub_time = book_pub_time;
    }

    private String book_detail;
    private String book_publisher;
    private Date book_pub_time;
    private Integer type_id;

    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }
}
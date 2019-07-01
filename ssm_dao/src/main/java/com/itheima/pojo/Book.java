package com.itheima.pojo;


import lombok.Data;

/**
 * @author think
 */
@Data
public class Book {

    private Long id;
    private String bookname;
    private String author;
    private String company;
    private Double price;
    private Long kindId;

    private Kind kind;

}

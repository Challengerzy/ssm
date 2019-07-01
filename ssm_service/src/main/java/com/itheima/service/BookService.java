package com.itheima.service;

import com.itheima.pojo.Book;

import java.util.List;

/**
 * @author Challenger
 * @date 2019/6/27 22:40
 * projectName spring
 * description
 */
public interface BookService {

    /**
     * 查询所有书籍
     *
     * @return
     */
    List<Book> findAll();
}

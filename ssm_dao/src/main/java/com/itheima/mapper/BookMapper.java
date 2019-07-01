package com.itheima.mapper;

import com.itheima.pojo.Book;

import java.util.List;

/**
 * @author Challenger
 * @date 2019/6/29 20:39
 * projectName ssm
 * description
 */
public interface BookMapper {

    /**
     * 查询所有
     * @return
     */
    List<Book> findAll();
}

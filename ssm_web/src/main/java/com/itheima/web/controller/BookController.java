package com.itheima.web.controller;

import com.itheima.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Challenger
 * @date 2019/6/29 21:05
 * projectName ssm
 * description
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;


    /**
     * 图书列表显示
     *
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model) {
        model.addAttribute("books", bookService.findAll());
        return "bookList";
    }
}

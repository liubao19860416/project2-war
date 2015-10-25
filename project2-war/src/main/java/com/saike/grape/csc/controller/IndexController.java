package com.saike.grape.csc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 测试页面Controller
 */
@Controller
public class IndexController extends CSCBaseController {
    /**
     * 测试页面
     */
    @RequestMapping("/index")
    public String list(Model model) {
        System.out.println("Hello World!");
        return "index.ftl";
    }
}

package com.book.controller;

import com.book.domain.Lend;
import com.book.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/lend")
public class LendController {
    @Autowired
    private LendService lendService;
    @RequestMapping("/lendlist")
    public String getLendList(Model model) {
        List<Lend> list = lendService.lendList();
        model.addAttribute("list",list);
        return "admin_lendlist";
    }
}

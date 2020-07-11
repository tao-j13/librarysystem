package com.book.controller;

import com.book.domain.Lend;
import com.book.domain.ReadInfo;
import com.book.service.LendService;
import com.book.service.ReadInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/reader")
public class ReaderController {
    @Autowired
    ReadInfoService readInfoService;
    @Autowired
    private LendService lendService;
    @RequestMapping("/allReaders")
    public String getAllReaders(Model model) {
        List<ReadInfo> list= readInfoService.readerInfos();
        model.addAttribute("readerlist",list);
        return "admin_readers";
    }
    @RequestMapping("/editReader")
    public String editReader(Integer readerId, Model model) {
        ReadInfo readInfo = readInfoService.getReaderInfo(readerId);
        model.addAttribute("readerInfo",readInfo);
        return "admin_reader_edit";
    }
    @RequestMapping("/editReader_do")
    public String editReaderDo(ReadInfo readinfo, RedirectAttributes redirectAttributes) {
        boolean flag = readInfoService.editReaderInfo(readinfo);
        if(flag) {
            redirectAttributes.addFlashAttribute("succ","修改读者信息成功");
            return "redirect:allReaders";
        }else {
            redirectAttributes.addFlashAttribute("error","修改读者信息失败");
            return "redirect:allReaders";
        }
    }
    @RequestMapping("deleteReader")
    public String deleteReader(Integer readerId,RedirectAttributes model) {
        List<Lend> list = lendService.userLendList(readerId);
        for(Lend temp:list) {
            if(temp.getBackDate() == null){
                model.addFlashAttribute("error","该读者有借出记录，不能直接删除，需先归还书籍！");
                return "redirect:allReaders";
            }
        }
        boolean flag = readInfoService.deleteReaderInfo(readerId);
        if(flag) {
            model.addFlashAttribute("succ","删除读者成功");
            return "redirect:allReaders";
        }else {
            model.addFlashAttribute("error","删除读者失败");
            return "redirect:allReaders";
        }
    }
}

package com.book.controller;

import com.book.domain.Book;
import com.book.domain.ReadInfo;
import com.book.service.BookService;
import com.book.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private LendService lendService;

    @RequestMapping("/allbooks")
    public String getAllBooks(Model model) {
        List<Book> list = bookService.getAllBooks();
        model.addAttribute("books", list);
        return "admin_books";
    }

    @RequestMapping("/book_add")
    public String addBook() {
        return "admin_book_add";
    }

    @RequestMapping("/book_add_do")
    public String addBookDo(Book book, RedirectAttributes redirectAttributes) {
        boolean flag = bookService.addBook(book);
        if (flag) {
            redirectAttributes.addFlashAttribute("succ", "图书添加成功");
            return "redirect:allbooks";
        } else {
            redirectAttributes.addFlashAttribute("error", "图书添加失败");
            return "redirect:allbooks";
        }
    }

    @RequestMapping("/bookdetail")
    public String getBookDetail(Long bookId, Model model) {
        Book book = bookService.getBook(bookId);
        model.addAttribute("detail", book);
        return "admin_book_detail";
    }

    @RequestMapping("/editbook")
    public String editBookInfo(Long bookId, Model model) {
        Book book = bookService.getBook(bookId);
        model.addAttribute("detail", book);
        return "admin_book_edit";
    }

    @RequestMapping("/updatebook")
    public String updateBookInfo(Book book, RedirectAttributes redirectAttributes) {
        boolean flag = bookService.editBook(book);
        if (flag) {
            redirectAttributes.addFlashAttribute("succ", "修改成功");
            return "redirect:allbooks";
        } else {
            redirectAttributes.addFlashAttribute("error", "修改失败");
            return "redirect:allbooks";
        }
    }

    @RequestMapping("/querybook")
    public String queryBookInfo(String keyword, Model model) {
        boolean flag = bookService.matchBook(keyword);
        if (flag) {
            List<Book> list = bookService.queryBook(keyword);
            model.addAttribute("succ", "查找成功");
            model.addAttribute("books", list);
            return "admin_books";
        } else {
            model.addAttribute("error", "没有匹配的书籍");
            return "admin_books";
        }
    }

    @RequestMapping("/deletebook")
    public String deletBook(Long bookId, RedirectAttributes redirectAttributes) {
        int flag = bookService.deleteBook(bookId);
        if (flag == 1) {
            redirectAttributes.addFlashAttribute("succ", "删除成功");
            return "redirect:allbooks";
        } else {
            redirectAttributes.addFlashAttribute("error", "删除失败");
            return "redirect:allbooks";
        }
    }
}


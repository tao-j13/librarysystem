package com.book.controller;

import com.book.domain.Admin;
import com.book.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/loginCheck")
    @ResponseBody
    public  Map<String,String> loginCheck(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");
        boolean isReader = loginService.hasMatchReader(id,password);
        boolean isAdmin = loginService.hasMatchAdmin(id,password);
        request.getContextPath();
        Map<String,String> map = new HashMap<>();
        if(!isReader && !isAdmin) {
            map.put("statCode","0");
            map.put("msg","密码错误");
        } else if(isAdmin) {
            Admin admin = new Admin();
            admin.setAdminId(id);
            admin.setPassword(password);
            request.getSession().setAttribute("admin",admin);
            map.put("stateCode","1");
            map.put("msg","管理员登陆成功");
        }else {
            map.put("stateCode","2");
            map.put("msg","读者登陆成功");
        }
        return map;
    }
    @RequestMapping("/admin_main.html")
    public String adminMain() {
        return "admin_main";
    }

    @RequestMapping("/logout.html")
    public String logout() {
        return "redirect:../index.jsp";
    }

    @RequestMapping("/admin_repasswd")
    public String editPassword() {
        return "admin_repasswd";
    }
    @RequestMapping("/admin_repasswd_do")
    public String editPasswordDo(HttpServletRequest request, String oldPasswd,
                                 String newPasswd, RedirectAttributes redirectAttributes){
        Admin admin = (Admin)request.getSession().getAttribute("admin");
        int id = admin.getAdminId();
        String passwd = loginService.getAdminPasswd(id);
        if(passwd.equals(oldPasswd)) {
            boolean flag = loginService.adminRePasswd(id,newPasswd);
            if(flag) {
                redirectAttributes.addFlashAttribute("succ","修改密码成功");
                return "redirect:admin_repasswd";
            }else {
                redirectAttributes.addFlashAttribute("error","修改密码失败");
                return "redirect:admin_repasswd";
            }
        }else {
            redirectAttributes.addFlashAttribute("error","旧密码错误");
            return "redirect:admin_repasswd";
        }
    }

}

package com.jt;

import com.book.dao.IAdminDao;
import com.book.dao.impl.BookDaoImp;
import com.book.dao.impl.LendDaoImpl;
import com.book.domain.Book;
import com.book.domain.Lend;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class Test {
    @org.junit.Test
    public void testJdbc() {
        ApplicationContext app = new ClassPathXmlApplicationContext("spring.xml");
        IAdminDao ld = app.getBean("adminDao",IAdminDao.class);
       String str = ld.getPassword(111);
       if(str == null) System.out.println("null");
       if(str == "") System.out.println("空字符串");
       if(str.isEmpty()) System.out.println("isEmpty()");
    }
    @org.junit.Test
    public void testDate() {
        System.out.println(new Date());
    }
}

package com.book.dao.impl;

import com.book.dao.IBookDao;
import com.book.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("bookdao")
public class BookDaoImp implements IBookDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private final static String ADD_BOOK_SQL="INSERT INTO book_info VALUES(NULL ,?,?,?,?,?,?,?,?,?,?,?)";
    private final static String DELETE_BOOK_SQL="delete from book_info where book_id = ?  ";
    private final static String EDIT_BOOK_SQL="update book_info set name= ? ,author= ? ,publish= ? ,ISBN= ? ,introduction= ? ,language= ? ,price= ? ,pubdate= ? ,class_id= ? ,pressmark= ? ,state= ?  where book_id= ? ;";
    private final static String QUERY_ALL_BOOKS_SQL="SELECT * FROM book_info ";
    private final static String QUERY_BOOK_SQL="SELECT * FROM book_info WHERE book_id like  ?  or name like ?   ";
    //查询匹配图书的个数
    private final static String MATCH_BOOK_SQL="SELECT count(*) FROM book_info WHERE book_id like ?  or name like ?  ";
    //根据书号查询图书
    private final static String GET_BOOK_SQL="SELECT * FROM book_info where book_id = ? ";
    @Override
    public int matchBook(String keyword) {
        String str = "%" + keyword + "%";
        return jdbcTemplate.queryForObject(MATCH_BOOK_SQL,new Object[]{str,str},Integer.class);
    }

    @Override
    public List<Book> queryBook(String keyword) {
        String str = "%" + keyword + "%";
       return jdbcTemplate.query(QUERY_BOOK_SQL,new Object[]{str,str},new BeanPropertyRowMapper<Book>(Book.class));
    }

    @Override
    public List<Book> getAllBooks() {
        return jdbcTemplate.query(QUERY_ALL_BOOKS_SQL,new BeanPropertyRowMapper<Book>(Book.class));
    }

    @Override
    public int addBook(Book book) {
        return jdbcTemplate.update(ADD_BOOK_SQL,book.getName(),book.getAuthor(),
                book.getPublish(),book.getIsbn(),book.getIntroduction(),book.getLanguage()
        ,book.getPrice(),book.getPubdate(),book.getClassId(),book.getPressmark(),book.getState());
    }

    @Override
    public int deleteBook(Long bookId) {
       return jdbcTemplate.update(DELETE_BOOK_SQL,bookId);
    }

    @Override
    public int editBook(Book book) {
        return jdbcTemplate.update(EDIT_BOOK_SQL,book.getName(),book.getAuthor(),
                book.getPublish(),book.getIsbn(),book.getIntroduction(),book.getLanguage()
                ,book.getPrice(),book.getPubdate(),book.getClassId(),book.getPressmark(),book.getState(),book.getBookId());
    }

    @Override
    public Book getBook(Long bookId) {
        List<Book> list = jdbcTemplate.query(GET_BOOK_SQL,new BeanPropertyRowMapper<Book>(Book.class),bookId);
        return list.get(0);
    }
}

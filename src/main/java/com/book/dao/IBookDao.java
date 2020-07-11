package com.book.dao;

import com.book.domain.Book;

import java.util.List;

public interface IBookDao {
    int matchBook(String keyword);
    List<Book> queryBook(String keyword);
    List<Book> getAllBooks();
    int addBook(Book book);
    int deleteBook(Long bookId);
    int editBook(Book book);
    Book getBook(Long bookId);


}

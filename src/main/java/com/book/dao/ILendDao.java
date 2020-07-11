package com.book.dao;

import com.book.domain.Lend;

import java.util.List;

public interface ILendDao {
    int bookReturnStepOne(long bookId);
    int bookReturnStepTwo(long bookId);
    int bookLendStepOne(long bookId,int readerId);
    int bookLendStepTwo(long bookId);
    List<Lend> lendList();
    List<Lend> userLendList(int readerId);
}

package com.book.service;

import com.book.dao.ILendDao;
import com.book.domain.Lend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LendService {
    @Autowired
    private ILendDao lendDao;
    public boolean bookReturn(long bookId){
        return lendDao.bookReturnStepOne(bookId)>0 && lendDao.bookReturnStepTwo(bookId)>0;
    }

    public boolean bookLend(long bookId,int readerId){
        return lendDao.bookLendStepOne(bookId,readerId)>0 && lendDao.bookLendStepTwo(bookId)>0;
    }

    public List<Lend> lendList(){
        return lendDao.lendList();
    }
    public List<Lend> userLendList(int readerId){
        return lendDao.userLendList(readerId);
    }
}

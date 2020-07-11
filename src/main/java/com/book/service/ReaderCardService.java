package com.book.service;

import com.book.dao.IReaderCardDao;
import com.book.dao.IReaderInfoDao;
import com.book.domain.ReadInfo;
import com.book.domain.ReaderCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReaderCardService {
    @Autowired
    private IReaderCardDao readerCardDao;
    public boolean addReaderCard(ReadInfo readerInfo){
        return  readerCardDao.addReaderCard(readerInfo)>0;
    }
    public boolean updatePasswd(int readerId,String passwd){
        return readerCardDao.rePassword(readerId,passwd)>0;
    }
    public boolean updateName(int readerId,String name){
        return readerCardDao.updateName(readerId,name)>0;
    }
}

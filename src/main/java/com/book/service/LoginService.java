package com.book.service;

import com.book.dao.IAdminDao;
import com.book.dao.IReaderCardDao;
import com.book.dao.IReaderInfoDao;
import com.book.domain.ReadInfo;
import com.book.domain.ReaderCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    private IReaderCardDao readerCardDao;
    @Autowired
    private IReaderInfoDao readerInfoDao;
    @Autowired
    private IAdminDao adminDao;
    public boolean hasMatchReader(int readerId,String passwd){
        return  readerCardDao.getMatchCount(readerId, passwd)>0;
    }

    public ReaderCard findReaderCardByUserId(int readerId){
        return readerCardDao.findReaderByReaderId(readerId);
    }
    public ReadInfo findReaderInfoByReaderId(int readerId){
        return readerInfoDao.findReaderInfoByReaderId(readerId);
    }

    public boolean hasMatchAdmin(int adminId,String password){
        return adminDao.getMatchCount(adminId,password)==1;
    }

    public boolean adminRePasswd(int adminId,String newPasswd){
        return adminDao.rePassword(adminId,newPasswd)>0;
    }
    public String getAdminPasswd(int id){
        return adminDao.getPassword(id);
    }
}

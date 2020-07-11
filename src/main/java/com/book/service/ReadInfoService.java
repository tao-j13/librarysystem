package com.book.service;

import com.book.dao.IReaderInfoDao;
import com.book.domain.ReadInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReadInfoService {
    @Autowired
    private IReaderInfoDao readerInfoDao;
    public List<ReadInfo> readerInfos(){
        return readerInfoDao.getAllReaderInfo();
    }

    public boolean deleteReaderInfo(int readerId){
        return readerInfoDao.deleteReaderInfo(readerId)>0;
    }

    public ReadInfo getReaderInfo(int readerId){
        return readerInfoDao.findReaderInfoByReaderId(readerId);
    }
    public boolean editReaderInfo(ReadInfo readerInfo){
        return readerInfoDao.editReaderInfo(readerInfo)>0;
    }
    public boolean addReaderInfo(ReadInfo readerInfo){
        return  readerInfoDao.addReaderInfo(readerInfo)>0;
    }
}

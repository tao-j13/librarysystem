package com.book.dao;

import com.book.domain.ReadInfo;

import java.util.List;

public interface IReaderInfoDao {

    List<ReadInfo> getAllReaderInfo();
    ReadInfo findReaderInfoByReaderId(int readerId);
    int deleteReaderInfo(int readerId);
    int editReaderInfo(ReadInfo readInfo);
    int addReaderInfo(ReadInfo readInfo);
}

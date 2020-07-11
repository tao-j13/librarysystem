package com.book.dao;

import com.book.domain.ReadInfo;
import com.book.domain.ReaderCard;

public interface IReaderCardDao {
    int getMatchCount(int readerId,String password);
    ReaderCard findReaderByReaderId(int userId);
    int rePassword(int readerId,String newPassword);
    int addReaderCard(ReadInfo readInfo);
    int updateName(int readerId,String name);
}

package com.book.dao;

public interface IAdminDao {
    int getMatchCount(int adiminId,String password);
    int rePassword(int adminId,String newPassword);
    String getPassword(int adminId);
}

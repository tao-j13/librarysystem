package com.book.dao.impl;

import com.book.dao.IAdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDaoImpl implements IAdminDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final String MATCH_ADMIN_SQL="SELECT COUNT(*) FROM admin where admin_id = ? and password = ? ";
    private static final String RE_PASSWORD_SQL="UPDATE admin set password = ? where admin_id = ? ";
    private static final String GET_PASSWD_SQL="SELECT password from admin where admin_id = ?";

    @Override
    public int getMatchCount(int adiminId, String password) {
        return jdbcTemplate.queryForObject(MATCH_ADMIN_SQL,Integer.class,adiminId,password);
    }

    @Override
    public int rePassword(int adminId, String newPassword) {
       return jdbcTemplate.update(RE_PASSWORD_SQL,newPassword,adminId);
    }

    @Override
    public String getPassword(int adminId) {
        return jdbcTemplate.queryForObject(GET_PASSWD_SQL,String.class,adminId);
    }
}

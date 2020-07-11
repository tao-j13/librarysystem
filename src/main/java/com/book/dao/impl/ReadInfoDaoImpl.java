package com.book.dao.impl;

import com.book.dao.IReaderCardDao;
import com.book.dao.IReaderInfoDao;
import com.book.domain.ReadInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("readInfoDao")
public class ReadInfoDaoImpl implements IReaderInfoDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private final static String ADD_READER_INFO_SQL="INSERT INTO reader_info VALUES(?,?,?,?,?,?)";
    private final static String DELETE_READER_INFO_SQL="DELETE FROM reader_info where reader_id = ? ";
    private final static String GET_READER_INFO_SQL="SELECT * FROM reader_info where reader_id = ? ";
    private final static String UPDATE_READER_INFO="UPDATE reader_info set name = ? ,sex = ? ,birth = ? ,address = ? ,telcode = ? where reader_id = ? ";
    private final static String ALL_READER_INFO_SQL="SELECT * FROM reader_info";
    @Override
    public List<ReadInfo> getAllReaderInfo() {
        return jdbcTemplate.query(ALL_READER_INFO_SQL,new BeanPropertyRowMapper<ReadInfo>(ReadInfo.class));
    }

    @Override
    public ReadInfo findReaderInfoByReaderId(int readerId) {
        List<ReadInfo> list = jdbcTemplate.query(GET_READER_INFO_SQL,new BeanPropertyRowMapper<ReadInfo>(ReadInfo.class),readerId);
        return list.get(0);
    }

    @Override
    public int deleteReaderInfo(int readerId) {
        return jdbcTemplate.update(DELETE_READER_INFO_SQL,readerId);
    }

    @Override
    public int editReaderInfo(ReadInfo readInfo) {
        return jdbcTemplate.update(UPDATE_READER_INFO,readInfo.getName(),
                readInfo.getSex(),readInfo.getBirth(),readInfo.getAddress(),
                readInfo.getTelcode(),readInfo.getReaderId());
    }

    @Override
    public int addReaderInfo(ReadInfo readInfo) {
        return jdbcTemplate.update(ADD_READER_INFO_SQL,readInfo.getReaderId(),readInfo.getName(),
                readInfo.getSex(),readInfo.getBirth(),readInfo.getAddress(),
                readInfo.getTelcode());
    }
}

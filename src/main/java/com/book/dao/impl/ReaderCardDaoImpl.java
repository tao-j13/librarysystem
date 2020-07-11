package com.book.dao.impl;

import com.book.dao.IReaderCardDao;
import com.book.domain.ReadInfo;
import com.book.domain.ReaderCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class ReaderCardDaoImpl implements IReaderCardDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private final static String MATCH_COUNT_SQL="select count(*) from reader_card where reader_id = ? and passwd = ? ";
    private final static String FIND_READER_BY_USERID="select reader_id, name, passwd, card_state from reader_card where reader_id = ? ";
    private final static String RE_PASSWORD_SQL="UPDATE reader_card set passwd = ? where reader_id = ? ";
    private final static String ADD_READERCARD_SQL="INSERT INTO reader_card (reader_id,name) values ( ? , ?)";
    private final static String UPDATE_READER_NAME_SQL="UPDATE reader_card set name = ? where reader_id = ?";

    @Override
    public int getMatchCount(int readerId, String password) {
       return jdbcTemplate.queryForObject(MATCH_COUNT_SQL,Integer.class,readerId,password);
    }

    @Override
    public ReaderCard findReaderByReaderId(int readerId) {
        List<ReaderCard> list = jdbcTemplate.query(FIND_READER_BY_USERID,new
                BeanPropertyRowMapper<ReaderCard>(ReaderCard.class),readerId);
        return list.get(0);
    }

    @Override
    public int rePassword(int readerId, String newPassword) {
        return jdbcTemplate.update(RE_PASSWORD_SQL,newPassword,readerId);
    }

    @Override
    public int addReaderCard(ReadInfo readInfo) {
        return jdbcTemplate.update(ADD_READERCARD_SQL,readInfo.getReaderId(),readInfo.getName());
    }

    @Override
    public int updateName(int readerId, String name) {
        return jdbcTemplate.update(UPDATE_READER_NAME_SQL,name,readerId);
    }
}

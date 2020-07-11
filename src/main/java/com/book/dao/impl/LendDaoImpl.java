package com.book.dao.impl;

import com.book.dao.ILendDao;
import com.book.domain.Lend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Repository("lendDao")
public class LendDaoImpl implements ILendDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private final static String BOOK_RETURN_SQL_ONE="UPDATE lend_list SET back_date = ? WHERE book_id = ? AND back_date is NULL";

    private final static String BOOK_RETURN_SQL_TWO="UPDATE book_info SET state = 1 WHERE book_id = ? ";

    private final static String BOOK_LEND_SQL_ONE="INSERT INTO lend_list (book_id,reader_id,lend_date) VALUES ( ? , ? , ? )";

    private final static String BOOK_LEND_SQL_TWO="UPDATE book_info SET state = 0 WHERE book_id = ? ";

    private final static String LEND_LIST_SQL="SELECT * FROM lend_list";

    private final static String MY_LEND_LIST_SQL="SELECT * FROM lend_list WHERE reader_id = ? ";
    @Override
    public int bookReturnStepOne(long bookId) {
       return jdbcTemplate.update(BOOK_RETURN_SQL_ONE, sdf.format(new Date()),bookId);
    }

    @Override
    public int bookReturnStepTwo(long bookId) {
        return jdbcTemplate.update(BOOK_RETURN_SQL_TWO,bookId);
    }

    @Override
    public int bookLendStepOne(long bookId, int readerId) {
        return jdbcTemplate.update(BOOK_LEND_SQL_ONE,bookId,readerId,sdf.format(new Date()));
    }

    @Override
    public int bookLendStepTwo(long bookId) {
       return jdbcTemplate.update(BOOK_LEND_SQL_TWO,bookId);
    }

    @Override
    public List<Lend> lendList() {
        return jdbcTemplate.query(LEND_LIST_SQL,new BeanPropertyRowMapper<Lend>(Lend.class));
    }

    @Override
    public List<Lend> userLendList(int readerId) {
        return jdbcTemplate.query(MY_LEND_LIST_SQL,new BeanPropertyRowMapper<Lend>(Lend.class),readerId);
    }
}

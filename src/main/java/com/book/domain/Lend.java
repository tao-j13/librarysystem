package com.book.domain;

import java.io.Serializable;
import java.util.Date;

public class Lend implements Serializable {
    private long sernum;
    private long bookId;
    private Integer readerId;
    private Date lendDate;
    private Date backDate;

    public long getSernum() {
        return sernum;
    }

    public void setSernum(long sernum) {
        this.sernum = sernum;
    }

    public long getBookId() {
        return bookId;
    }

    public void setBookId(long bookId) {
        this.bookId = bookId;
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public Date getLendDate() {
        return lendDate;
    }

    public void setLendDate(Date lendDate) {
        this.lendDate = lendDate;
    }

    public Date getBackDate() {
        return backDate;
    }

    public void setBackDate(Date backDate) {
        this.backDate = backDate;
    }

    @Override
    public String toString() {
        return "Lend{" +
                "sernum=" + sernum +
                ", bookId=" + bookId +
                ", readerId=" + readerId +
                ", lendDate=" + lendDate +
                ", backDate=" + backDate +
                '}';
    }
}

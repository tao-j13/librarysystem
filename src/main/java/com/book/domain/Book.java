package com.book.domain;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable {
    private Long bookId;
    private String name;
    private String author;
    private String publish;
    private String isbn;
    private String introduction;
    private String language;
    private Double price;
    private Date pubdate;
    private Integer classId;
    private Integer pressmark;
    private Integer state;

    public long getBookId() {
        return bookId;
    }

    public void setBookId(long bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getPressmark() {
        return pressmark;
    }

    public void setPressmark(Integer pressmark) {
        this.pressmark = pressmark;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", publish='" + publish + '\'' +
                ", isbn='" + isbn + '\'' +
                ", introduction='" + introduction + '\'' +
                ", language='" + language + '\'' +
                ", price=" + price +
                ", pubdate=" + pubdate +
                ", classId=" + classId +
                ", pressmark=" + pressmark +
                ", state=" + state +
                '}';
    }
}

package com.book.domain;

import java.io.Serializable;

public class ReaderCard implements Serializable {
    private Integer readerId;
    private String name;
    private String password;
    private Integer cardState;

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getCardState() {
        return cardState;
    }

    public void setCardState(Integer cardState) {
        this.cardState = cardState;
    }

    @Override
    public String toString() {
        return "ReaderCard{" +
                "readerId=" + readerId +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", cardState=" + cardState +
                '}';
    }
}

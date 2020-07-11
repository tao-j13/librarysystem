package com.book.domain;

import java.io.Serializable;
import java.util.Date;

public class ReadInfo implements Serializable {
    private Integer readerId;
    private String name;
    private String sex;
    private Date birth;
    private String address;
    private String telcode;

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelcode() {
        return telcode;
    }

    public void setTelcode(String telcode) {
        this.telcode = telcode;
    }

    @Override
    public String toString() {
        return "ReadInfo{" +
                "readerId=" + readerId +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", birth=" + birth +
                ", address='" + address + '\'' +
                ", telcode='" + telcode + '\'' +
                '}';
    }
}

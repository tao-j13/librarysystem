package com.book.domain;

import java.io.Serializable;

public class Admin implements Serializable {
    private Integer adminId;
    private String password;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", password='" + password + '\'' +
                '}';
    }
}

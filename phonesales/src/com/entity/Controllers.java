package com.entity;

public class Controllers {
    private Integer ctid;

    private String ctnumber;

    private String ctpassword;

    public Integer getCtid() {
        return ctid;
    }

    public void setCtid(Integer ctid) {
        this.ctid = ctid;
    }

    public String getCtnumber() {
        return ctnumber;
    }

    public void setCtnumber(String ctnumber) {
        this.ctnumber = ctnumber == null ? null : ctnumber.trim();
    }

    public String getCtpassword() {
        return ctpassword;
    }

    public void setCtpassword(String ctpassword) {
        this.ctpassword = ctpassword == null ? null : ctpassword.trim();
    }
}
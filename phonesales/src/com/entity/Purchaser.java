package com.entity;

public class Purchaser {
    private Integer purid;

    private String purnumber;

    private String purpassword;

    private String purname;

    private String purtel;

    private String puraddress;
    
    private String puremail;
    
    public Integer getPurid() {
        return purid;
    }

    public void setPurid(Integer purid) {
        this.purid = purid;
    }

    public String getPurnumber() {
        return purnumber;
    }

    public void setPurnumber(String purnumber) {
        this.purnumber = purnumber == null ? null : purnumber.trim();
    }

    public String getPurpassword() {
        return purpassword;
    }

    public void setPurpassword(String purpassword) {
        this.purpassword = purpassword == null ? null : purpassword.trim();
    }

    public String getPurname() {
        return purname;
    }

    public void setPurname(String purname) {
        this.purname = purname == null ? null : purname.trim();
    }

    public String getPurtel() {
        return purtel;
    }

    public void setPurtel(String purtel) {
        this.purtel = purtel == null ? null : purtel.trim();
    }

    public String getPuraddress() {
        return puraddress;
    }

    public void setPuraddress(String puraddress) {
        this.puraddress = puraddress == null ? null : puraddress.trim();
    }
    
    public String getPuremail() {
        return puremail;
    }

    public void setPuremail(String puremail) {
        this.puremail = puremail == null ? null : puremail.trim();
    }
}
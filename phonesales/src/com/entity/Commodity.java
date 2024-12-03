package com.entity;

public class Commodity {
    private String Commid;

    private String Commnumber;

    private String Commname;

    private Integer sortid;

    private String Commobject;


    private String Commpicture1;

    private String Commpicture2;

    private String Commpicture3;

    private String Commpicture4;


    private String Commcontent;
    
    private String sortname;
    private Integer shuliang;
    private String modname;

    private Double modprice;
    
    private String catename;
    
    
    public String getModname() {
        return modname;
    }

    public void setModname(String modname) {
        this.modname = modname == null ? null : modname.trim();
    }
    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename == null ? null : catename.trim();
    }
    public Double getModprice() {
        return modprice;
    }

    public void setModprice(Double modprice) {
        this.modprice = modprice;
    }
    public String getCommid() 
    {
        return Commid;
    }

    public void setCommid(String Commid) 
    {
        this.Commid = Commid;
    }

    
    public Integer getShuliang() 
    {
        return shuliang;
    }

    public void setShuliang(Integer shuliang) 
    {
        this.shuliang = shuliang;
    }
    
    
    public String getCommnumber() {
        return Commnumber;
    }

    public void setCommnumber(String Commnumber) {
        this.Commnumber = Commnumber;
    }

    public String getCommname() {
        return Commname;
    }

    public void setCommname(String Commname) {
        this.Commname = Commname == null ? null : Commname.trim();
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public String getCommobject() {
        return Commobject;
    }

    public void setCommobject(String Commobject) {
        this.Commobject = Commobject == null ? null : Commobject.trim();
    }



    public String getCommpicture1() {
        return Commpicture1;
    }

    public void setCommpicture1(String Commpicture1) {
        this.Commpicture1 = Commpicture1 == null ? null : Commpicture1.trim();
    }

    public String getCommpicture2() {
        return Commpicture2;
    }

    public void setCommpicture2(String Commpicture2) {
        this.Commpicture2 = Commpicture2 == null ? null : Commpicture2.trim();
    }

    public String getCommpicture3() {
        return Commpicture3;
    }

    public void setCommpicture3(String Commpicture3) {
        this.Commpicture3 = Commpicture3 == null ? null : Commpicture3.trim();
    }

    public String getCommpicture4() {
        return Commpicture4;
    }

    public void setCommpicture4(String Commpicture4) {
        this.Commpicture4 = Commpicture4 == null ? null : Commpicture4.trim();
    }

    public String getCommcontent() {
        return Commcontent;
    }

    public void setCommcontent(String Commcontent) {
        this.Commcontent = Commcontent == null ? null : Commcontent.trim();
    }
    
    public String getSortname() {
        return sortname;
    }

    public void setSortname(String sortname) {
        this.sortname = sortname == null ? null : sortname.trim();
    }
}
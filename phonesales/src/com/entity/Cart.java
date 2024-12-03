package com.entity;

public class Cart {
    private Integer crid;

    private Integer modid;

    private Integer commquantity;

    private Integer purid;
    
    private String commname;
    private String modname;
    
    private Long modprice;

    private String commpicture;
    
    private Long jiage;
    
    public Integer getCrid() {
        return crid;
    }

    public void setCrid(Integer crid) {
        this.crid = crid;
    }

    public Integer getModid() {
        return modid;
    }

    public void setModid(Integer modid) {
        this.modid = modid;
    }

    public Integer getCommquantity() {
        return commquantity;
    }

    public void setCommquantity(Integer commquantity) {
        this.commquantity = commquantity;
    }

    public Integer getPurid() {
        return purid;
    }

    public void setPurid(Integer purid) {
        this.purid = purid;
    }
    
    public String getCommname() {
        return commname;
    }

    public void setCommname(String commname) {
        this.commname = commname == null ? null : commname.trim();
    }

    public Long getModprice() {
        return modprice;
    }

    public void setModprice(Long modprice) {
        this.modprice = modprice;
    }

    public String getCommpicture() {
        return commpicture;
    }

    public void setCommpicture(String commpicture) {
        this.commpicture = commpicture == null ? null : commpicture.trim();
    }
    
    public Long getJiage() {
        return jiage;
    }

    public void setJiage(Long jiage) {
        this.jiage = jiage;
    }
    
    public String getModname() {
        return modname;
    }

    public void setModname(String modname) {
        this.modname = modname == null ? null : modname.trim();
    }
}
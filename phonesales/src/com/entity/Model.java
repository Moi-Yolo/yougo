package com.entity;

public class Model {
    private Integer modid;

    private String commid;

    private String modname;

    private Double modprice;

    public Integer getModid() {
        return modid;
    }

    public void setModid(Integer modid) {
        this.modid = modid;
    }

    public String getCommid() {
        return commid;
    }

    public void setCommid(String commid) {
        this.commid = commid == null ? null : commid.trim();
    }

    public String getModname() {
        return modname;
    }

    public void setModname(String modname) {
        this.modname = modname == null ? null : modname.trim();
    }

    public Double getModprice() {
        return modprice;
    }

    public void setModprice(Double modprice) {
        this.modprice = modprice;
    }
}
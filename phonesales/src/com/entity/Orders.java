package com.entity;

public class Orders {
	  private Integer orid;

	    private String ornumber;

	    private String ortime;

	    private String orstate;

	    private Long commprice;

	    private Integer modid;

	    private Integer commquantity;

	    private Integer purid;

	    private String purname;

	    private String purtel;

	    private String puraddress;
	    private String ornotes;
	    private String assessflag;

	    private String assestime;
	    private String commpicture;
	    private String assrecontent;
    private Integer shuliang;
    private String commname;
    private String modname;
    public String getcommname() {
        return commname;
    }

    public void setcommname(String commname) {
        this.commname = commname == null ? null : commname.trim();
    }
    
    
    public Integer getOrid() {
        return orid;
    }

    public void setOrid(Integer orid) {
        this.orid = orid;
    }

    public String getOrnumber() {
        return ornumber;
    }

    public void setOrnumber(String ornumber) {
        this.ornumber = ornumber == null ? null : ornumber.trim();
    }

    public String getOrtime() {
        return ortime;
    }

    public void setOrtime(String ortime) {
        this.ortime = ortime == null ? null : ortime.trim();
    }

    public String getOrstate() {
        return orstate;
    }

    public void setOrstate(String orstate) {
        this.orstate = orstate == null ? null : orstate.trim();
    }

    public Long getCommprice() {
        return commprice;
    }

    public void setCommprice(Long commprice) {
        this.commprice = commprice;
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
    public String getModname() {
        return modname;
    }

    public void setModname(String modname) {
        this.modname = modname == null ? null : modname.trim();
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

    public String getAssessflag() {
        return assessflag;
    }

    public void setAssessflag(String assessflag) {
        this.assessflag = assessflag == null ? null : assessflag.trim();
    }

    public String getAssestime() {
        return assestime;
    }

    public void setAssestime(String assestime) {
        this.assestime = assestime == null ? null : assestime.trim();
    }

    public String getAssrecontent() {
        return assrecontent;
    }

    public void setAssrecontent(String assrecontent) {
        this.assrecontent = assrecontent == null ? null : assrecontent.trim();
    }
    
    public Integer getShuliang() 
    {
        return shuliang;
    }

    public void setShuliang(Integer shuliang) 
    {
        this.shuliang = shuliang;
    }
    
    public String getCommpicture() 
    {
        return commpicture;
    }

    public void setCommpicture(String commpicture) 
    {
        this.commpicture = commpicture == null ? null : commpicture.trim();
    }
    
    public String getOrnotes() 
    {
        return ornotes;
    }

    public void setOrnotes(String ornotes) 
    {
        this.ornotes = ornotes == null ? null : ornotes.trim();
    }

    
    
}
package com.zzptc.twds.pojo;

import java.util.Date;

public class Toworkload {
    private Integer toid;

    private Integer oid;

    private Integer userid;

    private String toname;

    private String totime;
    
    private Oworkload oworkload;
    
    private User user;
    
    
    

    public User getUser() {
		return user;
	}

	public Oworkload getOworkload() {
		return oworkload;
	}

	public Integer getToid() {
        return toid;
    }

    public void setToid(Integer toid) {
        this.toid = toid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getToname() {
        return toname;
    }

    public void setToname(String toname) {
        this.toname = toname == null ? null : toname.trim();
    }

	public String getTotime() {
		return totime;
	}

	public void setTotime(String totime) {
		this.totime = totime;
	}

  
}
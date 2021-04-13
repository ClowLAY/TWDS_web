package com.zzptc.twds.pojo;

public class User {
    private Integer userid;

    private Integer roleid;

    private Integer wId;

    private String username;

    private String password;

    private String name;
    
    private String email;

    private String phone;

    
    private Workteam workteam;//关联教研室表
    
    
    
    
  
	public Workteam getWorkteam() {
		return workteam;
	}

	public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getwId() {
        return wId;
    }

    public void setwId(Integer wId) {
        this.wId = wId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
  		return name;
  	}

  	public void setName(String name) {
  		this.name = name;
  	}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}
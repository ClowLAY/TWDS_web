package com.zzptc.twds.pojo;

import java.util.Date;

public class Classes {
    private Integer clId;

    private Integer mid;

    private String clName;

    private String clYear;

    private Integer clNum;
    
    //关联专业表
    private Majors majors;
    

	public Majors getMajors() {
		return majors;
	}


	public Integer getClId() {
        return clId;
    }

    public void setClId(Integer clId) {
        this.clId = clId;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getClName() {
        return clName;
    }

    public void setClName(String clName) {
        this.clName = clName == null ? null : clName.trim();
    }

   

    public String getClYear() {
		return clYear;
	}

	public void setClYear(String clYear) {
		this.clYear = clYear;
	}

	public Integer getClNum() {
        return clNum;
    }

    public void setClNum(Integer clNum) {
        this.clNum = clNum;
    }
}
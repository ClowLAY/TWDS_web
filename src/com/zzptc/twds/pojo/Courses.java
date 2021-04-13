package com.zzptc.twds.pojo;

public class Courses {
    private Integer coId;

    private Integer cId;

    private Integer fid;

    private String coName;
    
    private String coType;

    private Double coWeek;

    private Integer coWenum;

    private Double coTotal;

    private String coTerm;
    
    private String state;
    
    private College college;
    private Formula formula;
    


    
    
    
    
    
	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public Formula getFormula() {
		return formula;
	}



	public College getCollege() {
		return college;
	}

    
    
	public String getCoType() {
		return coType;
	}



	public void setCoType(String coType) {
		this.coType = coType;
	}



	public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getCoName() {
        return coName;
    }

    public void setCoName(String coName) {
        this.coName = coName == null ? null : coName.trim();
    }

    public Double getCoWeek() {
        return coWeek;
    }

    public void setCoWeek(Double coWeek) {
        this.coWeek = coWeek;
    }

    public Integer getCoWenum() {
        return coWenum;
    }

    public void setCoWenum(Integer coWenum) {
        this.coWenum = coWenum;
    }

    public Double getCoTotal() {
        return coTotal;
    }

    public void setCoTotal(Double coTotal) {
        this.coTotal = coTotal;
    }

    public String getCoTerm() {
        return coTerm;
    }

    public void setCoTerm(String coTerm) {
        this.coTerm = coTerm == null ? null : coTerm.trim();
    }
}
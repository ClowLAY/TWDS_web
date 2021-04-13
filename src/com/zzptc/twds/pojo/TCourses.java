package com.zzptc.twds.pojo;

public class TCourses {
    private Integer tid;

    private Integer coId;

    private Integer userid;

    private Integer clId;
    
    private String state;
    
    private double totalTworkload;//教学工作量值
    private double totalOworkload;//其它工作值
    private double totalworkload;//教学工作量和其它工作量值和
    
    private Courses courses;
    private Classes classes;
    private User user;
    private Formula formula;
    
    private  Double xvalue;
    
    private  Double yvalue;
    
    
    
    
    

    public Double getXvalue() {
		return xvalue;
	}

	public void setXvalue(Double xvalue) {
		this.xvalue = xvalue;
	}

	public Double getYvalue() {
		return yvalue;
	}

	public void setYvalue(Double yvalue) {
		this.yvalue = yvalue;
	}

	public void setCourses(Courses courses) {
		this.courses = courses;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setFormula(Formula formula) {
		this.formula = formula;
	}

	public double getTotalworkload() {
		return totalworkload;
	}

	public void setTotalworkload(double totalworkload) {
		this.totalworkload = totalworkload;
	}

	public double getTotalOworkload() {
		return totalOworkload;
	}

	public void setTotalOworkload(double totalOworkload) {
		this.totalOworkload = totalOworkload;
	}

	public double getTotalTworkload() {
		return totalTworkload;
	}

	public void setTotalTworkload(double totalTworkload) {
		this.totalTworkload = totalTworkload;
	}

	public Formula getFormula() {
		return formula;
	}

    public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public User getUser() {
		return user;
	}

	public Courses getCourses() {
		return courses;
	}

	public Classes getClasses() {
		return classes;
	}

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getClId() {
        return clId;
    }

    public void setClId(Integer clId) {
        this.clId = clId;
    }
}
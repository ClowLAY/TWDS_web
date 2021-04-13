package com.zzptc.twds.pojo;

public class Examines extends PageInfor {
    private Integer eid;

    private Integer tid;

    private Double value;

    private String result;
    
    private int eWeek;
   
   private String etime;
   
   
   private TCourses tCourses;
   
   private Courses courses;
   private College college;
   
   private User user;
   private Integer userid;//用于通过用户id和审核状态查询数据
   
   /*
    *下面字段是用于待审核的关联字段
    * 
    * 
    */
   
   
   private String name;
   private String cName;
   private String coName;
   private String coTerm;
   
   
   //通过学院查询
   
   private Integer cId;
   
   
   public Integer getcId() {
	return cId;
}



public void setcId(Integer cId) {
	this.cId = cId;
}



public String getName() {
	return user.getName();
}



public String getcName() {
	return college.getcName();
}


public String getCoName() {
	return courses.getCoName();
}



public String getCoTerm() {
	return courses.getCoTerm();
}







public Integer getUserid() {
	return userid;
}

public void setUserid(Integer userid) {
	this.userid = userid;
}


   
   
   

	public College getCollege() {
	return college;
}

	public User getUser() {
	return user;
}

	public Courses getCourses() {
	return courses;
}

	public TCourses gettCourses() {
	return tCourses;
}

	public String getEtime() {
	return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public int geteWeek() {
		return eWeek;
	}
	
	public void seteWeek(int eWeek) {
		this.eWeek = eWeek;
	}

	public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

	@Override
	public String toString() {
		return "Examines [eid=" + eid + ", tid=" + tid + ", value=" + value + ", result=" + result + ", eWeek=" + eWeek
				+ ", etime=" + etime + ", tCourses=" + tCourses + ", courses=" + courses + ", user=" + user
				+ ", userid=" + userid + ", name=" + name + ", cName=" + cName + ", coName=" + coName + ", coTerm="
				+ coTerm + ", college=" + college + "]";
	}
    
    
}
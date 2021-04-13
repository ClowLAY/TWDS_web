package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.College;

public interface CollegeService {

	public List<College> selectAll();
	
	//添加二级学院
	public boolean insertSelective(College college);
	
	//删除指定二级学院
	public boolean deleteByPrimaryKey(int cId);
	
	//修改二级学院信息
	public boolean updateByPrimaryKeySelective(College college);
}

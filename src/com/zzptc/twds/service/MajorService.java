package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Majors;

public interface MajorService {
	
	// 根据id更改数据
	boolean updateByPrimaryKey(Majors record);
	
	
	//查找全部专业
	List<Majors>  selectAll();
	
	//添加专业
	boolean insertSelective(Majors record);
	
	//删除数据
	boolean deleteByPrimaryKey(int mid);

}

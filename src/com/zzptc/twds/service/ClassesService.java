package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Classes;

public interface ClassesService {

	//修改班级数据
	boolean updateByPrimaryKeySelective(Classes record);
	
	//查询全部数据
	List<Classes>  selectAll();
	
	//添加班级
	boolean insertSelective(Classes record);
	
	//删除指定班级
	boolean deleteByPrimaryKey(Integer clId);
	
	//查询全部数据
	List<Classes>  selectAllClasses();
	
	//通过id查询
	Classes selectByPrimaryKey(Integer clId);
}

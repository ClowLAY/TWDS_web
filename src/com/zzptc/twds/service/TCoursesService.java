package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.TCourses;

public interface TCoursesService {
	
	//添加老师申报课程数据
	boolean insertSelective(TCourses record);
	
	//查询所有数据
	List<TCourses> selectAll();
	
	//多表联合查询当前用户所有数据
	List<TCourses> selectAllTCourses();
	
	//多表联合查询当前用户所有数据
	List<TCourses> selectAllTCoursesByUserid(int userid);
	
	//根据课程id查询记录
	TCourses selectBycoId(Integer coId);
	
	//删除指定id数据
	boolean deleteByPrimaryKey(int tid);
	
	//通过id查询
	TCourses selectByPrimaryKey(int tid);
	
	//根据id修改数据
	boolean updateByPrimaryKeySelective(TCourses record);
}

package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Courses;

public interface CoursesService {

	//添加课程
	boolean insertSelective(Courses record);
	
	//修改课程内容
	boolean updateByPrimaryKeySelective(Courses record);
	
	//查询全部课程（与学院表关联）
	 List<Courses> selectAllCourses(Courses courses);
	 
	 //删除指定课程
	 boolean deleteByPrimaryKey(Integer coId);
	 
	 //根据id查找课程
	 Courses selectByPrimaryKey(Integer coId);
	 
	 //根据课程名查找课程
	 Courses selectByCoName(String coName);

	 //按照学期查找课程
	 List<Courses> selectBycoTerm(Courses courses);
	 
	//按照学院查找课程
	 List<Courses> selectAllCoursesBycId(Courses courses);
}

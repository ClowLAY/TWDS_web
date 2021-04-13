package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Courses;
import com.zzptc.twds.pojo.CoursesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CoursesMapper {
   /* int countByExample(CoursesExample example);

    int deleteByExample(CoursesExample example);

    

    int insert(Courses record);
    
    List<Courses> selectByExample(CoursesExample example);

   

    int updateByExampleSelective(@Param("record") Courses record, @Param("example") CoursesExample example);

    int updateByExample(@Param("record") Courses record, @Param("example") CoursesExample example);

   

    int updateByPrimaryKey(Courses record);*/
	
	
	int insertSelective(Courses record);
	
	int updateByPrimaryKeySelective(Courses record);
	
	 List<Courses> selectAllCourses(Courses courses);
	 
	 int deleteByPrimaryKey(Integer coId);
	 
	 Courses selectByPrimaryKey(Integer coId);
	 
	 Courses selectByCoName(String coName);
	 
	 List<Courses> selectBycoTerm(Courses courses);
	 
	 List<Courses> selectAllCoursesBycId(Courses courses);
	
}
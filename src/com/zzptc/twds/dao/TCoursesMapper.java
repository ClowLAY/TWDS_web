package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.TCourses;
import com.zzptc.twds.pojo.TCoursesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TCoursesMapper {
   /* int countByExample(TCoursesExample example);

    int deleteByExample(TCoursesExample example);

   

    int insert(TCourses record);

  

    List<TCourses> selectByExample(TCoursesExample example);

 

    int updateByExampleSelective(@Param("record") TCourses record, @Param("example") TCoursesExample example);

    int updateByExample(@Param("record") TCourses record, @Param("example") TCoursesExample example);

   

    int updateByPrimaryKey(TCourses record);*/
	  
	int insertSelective(TCourses record);
	
	List<TCourses> selectAll();
	
	List<TCourses> selectAllTCourses( );
	
	List<TCourses> selectAllTCoursesByUserid( int userid);
	
	 TCourses selectBycoId(Integer coId);
	
	 int deleteByPrimaryKey(Integer tid);
	 
	   TCourses selectByPrimaryKey(Integer tid);
	   
	   int updateByPrimaryKeySelective(TCourses record);
}
package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Classes;
import com.zzptc.twds.pojo.ClassesExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClassesMapper {
   /* int countByExample(ClassesExample example);

    int deleteByExample(ClassesExample example);

    int deleteByPrimaryKey(Integer clId);

    int insert(Classes record);

    int insertSelective(Classes record);

    List<Classes> selectByExample(ClassesExample example);

    

    int updateByExampleSelective(@Param("record") Classes record, @Param("example") ClassesExample example);

    int updateByExample(@Param("record") Classes record, @Param("example") ClassesExample example);

    int updateByPrimaryKeySelective(Classes record);

    */
	
	int updateByPrimaryKeySelective(Classes record);
	
	List<Classes>  selectAll();
	
	int insertSelective(Classes record);
	
	 int deleteByPrimaryKey(Integer clId);
	 
	 List<Classes>  selectAllClasses();
	 
	 Classes selectByPrimaryKey(Integer clId);
	 
	
	
}
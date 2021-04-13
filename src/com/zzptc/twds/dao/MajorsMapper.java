package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Majors;
import com.zzptc.twds.pojo.MajorsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MajorsMapper {
   /* int countByExample(MajorsExample example);

    int deleteByExample(MajorsExample example);

   

    int insert(Majors record);


    List<Majors> selectByExample(MajorsExample example);

    Majors selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") Majors record, @Param("example") MajorsExample example);

    int updateByExample(@Param("record") Majors record, @Param("example") MajorsExample example);

    int updateByPrimaryKeySelective(Majors record);

   */
	
	int updateByPrimaryKey(Majors record);
	
	List<Majors>  selectAll();
	
	int insertSelective(Majors record);
	
	 int deleteByPrimaryKey(Integer mid);
	
}
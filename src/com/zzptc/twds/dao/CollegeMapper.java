package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.College;
import com.zzptc.twds.pojo.CollegeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollegeMapper {
  /*  int countByExample(CollegeExample example);

    int deleteByExample(CollegeExample example);

    int deleteByPrimaryKey(Integer cId);

    int insert(College record);

   

    List<College> selectByExample(CollegeExample example);

    College selectByPrimaryKey(Integer cId);

    int updateByExampleSelective(@Param("record") College record, @Param("example") CollegeExample example);

    int updateByExample(@Param("record") College record, @Param("example") CollegeExample example);

    

    int updateByPrimaryKey(College record);*/
    int insertSelective(College record);
    
    List<College> selectAll();
    
    int deleteByPrimaryKey(int cId);
    
    int updateByPrimaryKeySelective(College college);
    
}
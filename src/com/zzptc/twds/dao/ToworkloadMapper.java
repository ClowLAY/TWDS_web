package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Toworkload;
import com.zzptc.twds.pojo.ToworkloadExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ToworkloadMapper {
/*    int countByExample(ToworkloadExample example);

    int deleteByExample(ToworkloadExample example);

  

   

    int insertSelective(Toworkload record);

    List<Toworkload> selectByExample(ToworkloadExample example);

    Toworkload selectByPrimaryKey(Integer toid);

    int updateByExampleSelective(@Param("record") Toworkload record, @Param("example") ToworkloadExample example);

    int updateByExample(@Param("record") Toworkload record, @Param("example") ToworkloadExample example);

   

    int updateByPrimaryKey(Toworkload record);*/
	
	 int insert(Toworkload record);
	 
	 List<Toworkload> selectAll();
	 
	 List<Toworkload> selectByUserId(int userid);
	 
	 List<Toworkload> selectAllToworkload();
	 
	  int deleteByPrimaryKey(Integer toid);
	  
	  int updateByPrimaryKeySelective(Toworkload record);
}
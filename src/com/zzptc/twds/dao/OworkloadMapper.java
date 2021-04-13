package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Oworkload;
import com.zzptc.twds.pojo.OworkloadExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OworkloadMapper {
   /* int countByExample(OworkloadExample example);

    int deleteByExample(OworkloadExample example);

   

   

    int insertSelective(Oworkload record);

    List<Oworkload> selectByExample(OworkloadExample example);

    
    int updateByExampleSelective(@Param("record") Oworkload record, @Param("example") OworkloadExample example);

    int updateByExample(@Param("record") Oworkload record, @Param("example") OworkloadExample example);

    int updateByPrimaryKeySelective(Oworkload record);

    int updateByPrimaryKey(Oworkload record);*/
	
	 int insert(Oworkload record);
	 
	 List<Oworkload> selectAll();
		 
	int updateByPrimaryKeySelective(Oworkload record);
	
	 int deleteByPrimaryKey(Integer oid);
	 
	 Oworkload selectByPrimaryKey(Integer oid);

}
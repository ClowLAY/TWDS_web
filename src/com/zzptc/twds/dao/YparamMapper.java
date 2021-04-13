package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Yparam;
import com.zzptc.twds.pojo.YparamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface YparamMapper {
   /* int countByExample(YparamExample example);

    int deleteByExample(YparamExample example);

    int deleteByPrimaryKey(Integer yid);

    int insert(Yparam record);

   

    List<Yparam> selectByExample(YparamExample example);

    Yparam selectByPrimaryKey(Integer yid);

    int updateByExampleSelective(@Param("record") Yparam record, @Param("example") YparamExample example);

    int updateByExample(@Param("record") Yparam record, @Param("example") YparamExample example);

    int updateByPrimaryKeySelective(Yparam record);

    int updateByPrimaryKey(Yparam record);*/
	
	
	 int insertSelective(Yparam record);
	 
	 List<Yparam> selectAll(int fid);
	 
}
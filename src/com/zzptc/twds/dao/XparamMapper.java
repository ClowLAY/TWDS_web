package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Xparam;
import com.zzptc.twds.pojo.XparamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XparamMapper {
   /* int countByExample(XparamExample example);

    int deleteByExample(XparamExample example);

    int deleteByPrimaryKey(Integer xid);

    int insert(Xparam record);


    List<Xparam> selectByExample(XparamExample example);

    Xparam selectByPrimaryKey(Integer xid);

    int updateByExampleSelective(@Param("record") Xparam record, @Param("example") XparamExample example);

    int updateByExample(@Param("record") Xparam record, @Param("example") XparamExample example);

    int updateByPrimaryKeySelective(Xparam record);

    int updateByPrimaryKey(Xparam record);*/
	
	 int insertSelective(Xparam record);
	 
	 List<Xparam> selectAll(int fid);
}
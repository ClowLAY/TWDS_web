package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.pojo.WorkteamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WorkteamMapper {
   /* int countByExample(WorkteamExample example);

    int deleteByExample(WorkteamExample example);

    int deleteByPrimaryKey(Integer wId);

    int insert(Workteam record);

    int insertSelective(Workteam record);

    List<Workteam> selectByExample(WorkteamExample example);

    Workteam selectByPrimaryKey(Integer wId);

    int updateByExampleSelective(@Param("record") Workteam record, @Param("example") WorkteamExample example);

    int updateByExample(@Param("record") Workteam record, @Param("example") WorkteamExample example);

    int updateByPrimaryKeySelective(Workteam record);

    int updateByPrimaryKey(Workteam record);*/
	int insert(Workteam record);
    
	List<Workteam> selectAll();
    
    int deleteByworkName(String workName);
    
    int updateBywId(Workteam workteam);
    
    Workteam selectByWorkName(String workName);
    
    Workteam selectBywId(int wId);
    
	List<Workteam> selectBycId(int cId);
    
    
    
}
package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Workteam;

public interface WorkteamService {
	public boolean insert(Workteam workteam);
	
	//查询全部教研室
	public List<Workteam> selectAll();
	
	//根据workname删除记录
	public boolean deleteByworkName(String workName);
	
	//通过workName查找教研室
	public Workteam selectByWorkName(String workName);
	
	//修改表数据
	boolean updateBywId(Workteam workteam);
	
	//通过学院查找教研室
	
	public List<Workteam> selectBycId(int cId);
	
	public Workteam selectBywId(int wId);

}

package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Toworkload;

public interface ToworkloadService {
	
	//分配教师其它工作量
	 boolean insert(Toworkload record);
	 
	 //查询全部教师的其它工作量
	 List<Toworkload> selectAll();
	 
	 //查询指定老师的全部其它工作量
	 List<Toworkload> selectByUserId(int userid);
	 
	 //查询全部教师的其它工作量(多表查询)
	 List<Toworkload> selectAllToworkload();

	 
	 //删除指定数据
	 boolean deleteByPrimaryKey(Integer toid);
	 
	 //修改指定数据
	 boolean updateByPrimaryKeySelective(Toworkload record);
}

package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Oworkload;

public interface OworkloadService {

	//添加其它工作量
	boolean insert(Oworkload record);
	 
	//查询全部其它工作量
	 List<Oworkload> selectAll();
	 
	 //修改其它工作量数据
	 boolean updateByPrimaryKeySelective(Oworkload record);
	 
	 //删除指定其它工作量
	 boolean deleteByPrimaryKey(int oid);
	 
	 //根据di查询其它工作量
	 Oworkload selectByPrimaryKey(Integer oid);
}

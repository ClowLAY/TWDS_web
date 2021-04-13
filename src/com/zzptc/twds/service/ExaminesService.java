package com.zzptc.twds.service;

import java.util.List;
import java.util.Map;

import com.zzptc.twds.pojo.Examines;
import com.zzptc.twds.pojo.User;

public interface ExaminesService {

	//添加工作量审核的记录
	boolean insertSelective(Examines record);
	
	//与老师课程表关联再通过userid查询数据
	List<Examines> selectAll(int userid);
	
	//与老师课程表关联查询未审核数据
	 List<Examines> selectAllByresult();
	 
	 
	//与老师课程表关联查询已审核数据
	List<Examines> selectAllByresult1();
	 
	 
	 //更改审核状态
	 boolean updateByPrimaryKeySelective(Examines record);
	 
	//通过学院与老师课程表关联查询未审核数据
	 List<Examines> selectAllByCld(int cId);
	 
	  //通过学院与老师课程表关联查询已审核数据
	 List<Examines> selectAllByCld1(int cId);
	 
	 //通过用户和审核状态查询数据
	  List<Examines>  selectByresultandUserId(Examines examines);
	  
	  
	  //用于分页查询
	  Map<String,Object> selectAllByresult(Examines examines,User user);
	  
	
	  
	 
	
}

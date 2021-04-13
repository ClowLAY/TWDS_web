package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Yparam;

public interface YparamService {
	
	//添加Y参数值
	 boolean insertSelective(Yparam record);
	 
	 //通过公式id查询数据
	 List<Yparam> selectAll(int fid);
}

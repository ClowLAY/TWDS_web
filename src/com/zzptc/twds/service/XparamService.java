package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.Xparam;

public interface XparamService {
	
	//添加X参数值
	boolean insertSelective(Xparam record);
	
	//通过公式id查询数据
	List<Xparam> selectAll(int fid);

}

package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.XparamMapper;
import com.zzptc.twds.pojo.Xparam;

@Service
public class XparamServiceImpl implements XparamService {

	@Autowired
	private XparamMapper xparamMapper;
	
	@Override
	public boolean insertSelective(Xparam record) {
		int i=xparamMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Xparam> selectAll(int fid) {
		return xparamMapper.selectAll(fid);
	}

}

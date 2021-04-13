package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.YparamMapper;
import com.zzptc.twds.pojo.Yparam;


@Service
public class YparamServiceImpl implements YparamService {

	
	@Autowired
	private YparamMapper yparamMapper;
	
	
	@Override
	public boolean insertSelective(Yparam record) {
		int i=yparamMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}


	@Override
	public List<Yparam> selectAll(int fid) {
		
		return yparamMapper.selectAll(fid);
	}

}

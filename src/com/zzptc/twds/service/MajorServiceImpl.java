package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.MajorsMapper;
import com.zzptc.twds.pojo.Majors;


@Service
public class MajorServiceImpl implements MajorService {

	@Autowired
	private MajorsMapper majorsMapper;
	
	@Override
	public boolean updateByPrimaryKey(Majors record) {
		int i=majorsMapper.updateByPrimaryKey(record);
		if(i>0) {
			return true;
		}
				
		return false;
	}

	@Override
	public List<Majors> selectAll() {
		// TODO Auto-generated method stub
		return majorsMapper.selectAll();
	}

	@Override
	public boolean insertSelective(Majors record) {
		int i=majorsMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
				
		return false;
	}

	@Override
	public boolean deleteByPrimaryKey(int mid) {
		int i=majorsMapper.deleteByPrimaryKey(mid);
		
		if(i>0) {
			return true;
		}
			
		return false;
	}

}

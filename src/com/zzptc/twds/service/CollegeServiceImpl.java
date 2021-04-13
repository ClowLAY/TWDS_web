package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.CollegeMapper;
import com.zzptc.twds.pojo.College;

@Service
public class CollegeServiceImpl implements CollegeService {
	
	@Autowired
	private CollegeMapper collegeMapper;

	@Override
	public List<College> selectAll() {
		return collegeMapper.selectAll();
	}

	@Override
	public boolean insertSelective(College college) {
		int i=collegeMapper.insertSelective(college);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteByPrimaryKey(int cId) {
		int i=collegeMapper.deleteByPrimaryKey(cId);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateByPrimaryKeySelective(College college) {
		int i=collegeMapper.updateByPrimaryKeySelective(college);
		if(i>0) {
			return true;
		}
		return false;
	}
	
	

}

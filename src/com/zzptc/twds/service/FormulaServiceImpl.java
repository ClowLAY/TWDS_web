package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.FormulaMapper;
import com.zzptc.twds.pojo.Formula;

@Service
public class FormulaServiceImpl implements FormulaService {

	@Autowired
	private FormulaMapper formulaMapper;
	
	@Override
	public List<Formula> selectAll() {
		return formulaMapper.selectAll();
	}

	
	@Override
	public int insertSelective(Formula record) {
		
		return formulaMapper.insertSelective(record);
	}


	@Override
	public Formula selectByFname(String fname) {
		return formulaMapper.selectByFname(fname);
	}


	@Override
	public boolean deleteByPrimaryKey(Integer fid) {
		int i=formulaMapper.deleteByPrimaryKey(fid);
		if(i>0) {
			return true;
		}
		
		return false;
	}


	@Override
	public boolean updateByPrimaryKey(Formula record) {
		int i=formulaMapper.updateByPrimaryKey(record);
		if(i>0) {
			return true;
		}
		
		return false;
	}

}

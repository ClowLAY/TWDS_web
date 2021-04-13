package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.ClassesMapper;
import com.zzptc.twds.pojo.Classes;

@Service
public class ClassesServiceImpl implements ClassesService {
	
	@Autowired
	private ClassesMapper classesMapper;
	

	@Override
	public boolean updateByPrimaryKeySelective(Classes record) {
		// TODO Auto-generated method stub
		int i=classesMapper.updateByPrimaryKeySelective(record);
		if(i>0) {
			return true;
		}
		return false;
	
	}

	@Override
	public List<Classes> selectAll() {
		return classesMapper.selectAll();
	}

	@Override
	public boolean insertSelective(Classes record) {
		int i=classesMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
		return false;
	
	}

	@Override
	public boolean deleteByPrimaryKey(Integer clId) {
		int i=classesMapper.deleteByPrimaryKey(clId);
		if(i>0) {
			return true;
		}
		return false;
	
	}

	@Override
	public List<Classes> selectAllClasses() {
		// TODO Auto-generated method stub
		return classesMapper.selectAllClasses();
	}

	@Override
	public Classes selectByPrimaryKey(Integer clId) {
		
		return classesMapper.selectByPrimaryKey(clId);
	}

}

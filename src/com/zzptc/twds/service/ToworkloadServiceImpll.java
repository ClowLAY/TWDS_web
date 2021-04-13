package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.ToworkloadMapper;
import com.zzptc.twds.pojo.Toworkload;

@Service
public class ToworkloadServiceImpll implements ToworkloadService {
	
	@Autowired
	private ToworkloadMapper toworkloadMapper;

	@Override
	public boolean insert(Toworkload record) {
		int i=toworkloadMapper.insert(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Toworkload> selectAll() {
		return toworkloadMapper.selectAll();
	}

	@Override
	public List<Toworkload> selectByUserId(int userid) {
		
		return toworkloadMapper.selectByUserId(userid);
	}

	@Override
	public List<Toworkload> selectAllToworkload() {
		// TODO Auto-generated method stub
		return toworkloadMapper.selectAllToworkload();
	}

	@Override
	public boolean deleteByPrimaryKey(Integer toid) {
		int i=toworkloadMapper.deleteByPrimaryKey(toid);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateByPrimaryKeySelective(Toworkload record) {
		int i=toworkloadMapper.updateByPrimaryKeySelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}
	
	
	

}

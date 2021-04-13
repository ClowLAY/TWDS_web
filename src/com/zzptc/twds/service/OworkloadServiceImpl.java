package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.OworkloadMapper;
import com.zzptc.twds.pojo.Oworkload;

@Service
public class OworkloadServiceImpl implements OworkloadService {

	@Autowired
	private OworkloadMapper oworkloadMapper;
	
	@Override
	public boolean insert(Oworkload record) {
		int i=oworkloadMapper.insert(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Oworkload> selectAll() {
		return oworkloadMapper.selectAll();
	}

	@Override
	public boolean updateByPrimaryKeySelective(Oworkload record) {
		int i=oworkloadMapper.updateByPrimaryKeySelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteByPrimaryKey(int oid) {
		int i=oworkloadMapper.deleteByPrimaryKey(oid);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public Oworkload selectByPrimaryKey(Integer oid) {
		return oworkloadMapper.selectByPrimaryKey(oid);
	}

}

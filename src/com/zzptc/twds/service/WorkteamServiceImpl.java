package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.WorkteamMapper;
import com.zzptc.twds.pojo.Workteam;


@Service
public class WorkteamServiceImpl implements WorkteamService {

	
	@Autowired 
	private WorkteamMapper workteamMapper; 
	
	//添加教研室
	@Override
	public boolean insert(Workteam workteam) {
		int i=workteamMapper.insert(workteam);
		if(i>0) {
			return true;
		}
		return false;
	}

	
	@Override
	public List<Workteam> selectAll() {
		return workteamMapper.selectAll();
	}


	@Override
	public boolean deleteByworkName(String workName) {
		int i=workteamMapper.deleteByworkName(workName);
		if(i>0) {
			return true;
		}
		return false;
	}


	@Override
	public Workteam selectByWorkName(String workName) {
		return workteamMapper.selectByWorkName(workName);
	}


	@Override
	public boolean updateBywId(Workteam workteam) {
		int i=workteamMapper.updateBywId(workteam);
		if(i>0) {
			return true;
		}
		return false;
	}


	@Override
	public List<Workteam> selectBycId(int cId) {
		return workteamMapper.selectBycId(cId);
	}


	@Override
	public Workteam selectBywId(int wId) {
		return workteamMapper.selectBywId(wId);
	}

}

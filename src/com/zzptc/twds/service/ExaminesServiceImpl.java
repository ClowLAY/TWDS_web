package com.zzptc.twds.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.ExaminesMapper;
import com.zzptc.twds.pojo.College;
import com.zzptc.twds.pojo.Examines;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;

@Service
public class ExaminesServiceImpl implements ExaminesService {

	@Autowired
	private ExaminesMapper examinesMapper;
	

	@Autowired
	private WorkteamService workteamService;
	

	@Override
	public boolean insertSelective(Examines record) {
		int i=examinesMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Examines> selectAll(int userid) {
		return examinesMapper.selectAll(userid);
	}

	@Override
	public List<Examines> selectAllByresult() {
		return examinesMapper.selectAllByresult();
	}

	@Override
	public boolean updateByPrimaryKeySelective(Examines record) {
		int i=examinesMapper.updateByPrimaryKeySelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Examines> selectAllByresult1() {
		return examinesMapper.selectAllByresult1();
	}

	@Override
	public List<Examines> selectAllByCld(int cId) {
		return examinesMapper.selectAllByCld(cId);
	}

	@Override
	public List<Examines> selectAllByCld1(int cId) {
		return examinesMapper.selectAllByCld1(cId);
	}

	@Override
	public List<Examines> selectByresultandUserId(Examines examines) {
		return examinesMapper.selectByresultandUserId(examines);
	}

	@Override
	public Map<String, Object> selectAllByresult(Examines examines,User user) {
		List<Examines> list=null;
		if(user.getRoleid()==3) {
			Workteam workteam=workteamService.selectBywId(user.getwId());
			examines.setcId(workteam.getcId());
			list=examinesMapper.selectAllByCld(workteam.getcId());
			//System.out.println("cId="+workteam.getcId());
		
		}else if(examines.getcId()!=null) {
			list=examinesMapper.selectAllByCld(examines.getcId());
		}else{
			list=examinesMapper.selectAllByresult();
		}
		
		Map<String,Object> map=new HashMap<>();
		List<Examines> list1=examinesMapper.selectAllByresultPage(examines);//分页查询
		map.put("total", list.size());
		
		//分页
			List<Examines> list2 =new ArrayList<>();
			int begin = examines.getBeginIndex();
			//int rows = project.getRows();
			int end = begin + examines.getRows();
			for(int i = 0; i<list1.size() && i<end;i++) {
				list2.add(list1.get(i));
			}
		//	map.put("total", list1.size());
			map.put("rows", list2);
			
			
		return map;
	}
	
	
	
}

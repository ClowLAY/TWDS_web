package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.TCoursesMapper;
import com.zzptc.twds.pojo.TCourses;
import com.zzptc.twds.pojo.TCoursesExample;


@Service
public class TCoursesServiceImpl implements TCoursesService {

	@Autowired
	private TCoursesMapper tCoursesMapper;
	
	@Override
	public boolean insertSelective(TCourses record) {
		int i=tCoursesMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<TCourses> selectAll() {
		return tCoursesMapper.selectAll();
	}

	@Override
	public List<TCourses> selectAllTCourses() {
		return tCoursesMapper.selectAllTCourses();
	}

	@Override
	public List<TCourses> selectAllTCoursesByUserid(int userid) {
		return tCoursesMapper.selectAllTCoursesByUserid(userid);
	}

	@Override
	public TCourses selectBycoId(Integer coId) {
		return tCoursesMapper.selectBycoId(coId);
	}

	@Override
	public boolean deleteByPrimaryKey(int tid) {
		int i=tCoursesMapper.deleteByPrimaryKey(tid);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public TCourses selectByPrimaryKey(int tid) {
		return tCoursesMapper.selectByPrimaryKey(tid);
	}

	@Override
	public boolean updateByPrimaryKeySelective(TCourses record) {
		int i=tCoursesMapper.updateByPrimaryKeySelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

}

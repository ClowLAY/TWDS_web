package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.CoursesMapper;
import com.zzptc.twds.pojo.Courses;


@Service
public class CoursesServiceImpl implements CoursesService {

	@Autowired 
	private CoursesMapper coursesMapper; 
	
	@Override
	public boolean insertSelective(Courses record) {
		int i=coursesMapper.insertSelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateByPrimaryKeySelective(Courses record) {
		int i=coursesMapper.updateByPrimaryKeySelective(record);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Courses> selectAllCourses(Courses record) {
		return coursesMapper.selectAllCourses(record);
	}

	@Override
	public boolean deleteByPrimaryKey(Integer coId) {
		int i=coursesMapper.deleteByPrimaryKey(coId);
		if(i>0) {
			return true;
		}
		return false;
	}

	@Override
	public Courses selectByPrimaryKey(Integer coId) {
		return coursesMapper.selectByPrimaryKey(coId);
	}

	@Override
	public Courses selectByCoName(String coName) {
		return coursesMapper.selectByCoName(coName);
	}

	@Override
	public List<Courses> selectBycoTerm(Courses courses) {
		return coursesMapper.selectBycoTerm(courses);
	}

	@Override
	public List<Courses> selectAllCoursesBycId(Courses record) {
		return coursesMapper.selectAllCoursesBycId(record);
	}

}

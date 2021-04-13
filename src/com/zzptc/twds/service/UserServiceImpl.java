package com.zzptc.twds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.UserMapper;
import com.zzptc.twds.pojo.User;


@Service
public class UserServiceImpl implements UserService {

	
	@Autowired 
	private UserMapper userMapper;
	
	//根据用户名和密码查找用户
	@Override
	public User selectUserAndPassword(User user) {
		return userMapper.selectUserAndPassword(user);
	}
	
	//根据userid查找用户
	@Override
	public User selectByPrimaryKey(int userid) {
		return userMapper.selectByPrimaryKey(userid);
	}

	//修改密码
	@Override
	public boolean updateByPrimaryKeySelective(User user) {
		int i=userMapper.updateByPrimaryKeySelective(user);
		if(i>0) {
			return true;
		}
		return false;
	}

	//添加用户
	@Override
	public boolean insertSelective(User user) {
		int i=userMapper.insertSelective(user);
		if(i>0) {
			return true;
		}
		return false;
	}
	
	//查找全部用户
	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	//删除指定用户
	@Override
	public boolean deleteByUserid(int userid) {
		int i=userMapper.deleteByUserid(userid);
		if(i>0) {
			return true;
		}
		
		return false;
	}

	@Override
	public List<User> selectAllBycId(int cId) {
		return userMapper.selectAllBycId(cId);
	}

	

}

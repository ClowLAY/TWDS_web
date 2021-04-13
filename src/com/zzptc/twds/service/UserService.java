package com.zzptc.twds.service;

import java.util.List;

import com.zzptc.twds.pojo.User;

public interface UserService {

	
	public User selectUserAndPassword(User user);
	
	//修改数据
	public boolean updateByPrimaryKeySelective(User user);
	
	//根据userid查找用户
	public User selectByPrimaryKey(int userid);
	
	//添加用户
	public boolean insertSelective(User user);
	
	public List<User> selectAll();
	
	//根据userid删除用户
	public boolean deleteByUserid(int userid);
	
	
	//通过学院查询用户
	List<User> selectAllBycId(int cId);
	
	
}

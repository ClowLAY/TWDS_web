package com.zzptc.twds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzptc.twds.dao.RoleMapper;
import com.zzptc.twds.pojo.Role;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public Role selectByPrimaryKey(int roleid) {
		return roleMapper.selectByPrimaryKey(roleid);
	}

}

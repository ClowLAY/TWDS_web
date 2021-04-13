package com.zzptc.twds.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzptc.twds.pojo.College;
import com.zzptc.twds.pojo.Role;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.service.RoleService;
import com.zzptc.twds.service.UserService;
import com.zzptc.twds.service.WorkteamService;
import com.zzptc.twds.utils.MessageBean;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private WorkteamService workteamService;
	
	private HttpSession session;
	
	
	//登录验证
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,String username,String password) {
		System.out.println("----"+username);
		session=request.getSession();
		ModelAndView view=new ModelAndView();
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		user=userService.selectUserAndPassword(user);
		
		if(user!=null) {
			Role role=roleService.selectByPrimaryKey(user.getRoleid());
			session.setAttribute("role", role);
			session.setAttribute("roleid", role.getRoleid());
			view.setViewName("main");
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUsername());
			session.setMaxInactiveInterval(30*60);
		}else {
			view.addObject("errorMsg", "用户名或密码错误");
			view.setViewName("login");
			System.out.println("登录失败");
		}
		
		return view;
	}
	
	
	//退出登录
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		session=request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("role");
		session.removeAttribute("username");
		return new ModelAndView("login");
	}
	
	
	
	//查询全部用户
	
	@RequestMapping("/user/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		
		User user=(User)session.getAttribute("user");
		if(user.getRoleid()==3) {
			Workteam workteam=workteamService.selectBywId(user.getwId());
			System.out.println("---"+workteam.getcId());
			List<User> list=userService.selectAllBycId(workteam.getcId());
			view.addObject("list", list);
		}else{
			List<User> list=userService.selectAll();
			view.addObject("list", list);
		}
	
		
		List<Workteam> listworkteam=workteamService.selectAll();
		view.addObject("listworkteam", listworkteam);
		view.setViewName("user/allUser");
		return view;
	}
	
	

	//查询全部用户
		@RequestMapping("/user/selectAllUser")
		@ResponseBody
		public List<User> selectAllUser() {
			List<User> list=userService.selectAll();
			return list;
		}
	
	

	
/*	//查询指定用户
	@RequestMapping("/user/selectByUserid")
	@ResponseBody
	public MessageBean selectByUserid(int userid) {
		MessageBean messageBean=new MessageBean("");
		User user=userService.selectByPrimaryKey(userid);
		messageBean.setOther(user);
		messageBean.setSuccess(true);		
		return messageBean;
	}*/
	
	
	
	//添加用户
	@RequestMapping("/user/insert")
	@ResponseBody
	public MessageBean insert(String roleid,String wId,String username,String password,String name,String email,String phone ) {
		MessageBean messageBean=new MessageBean("");
		List<User> list=userService.selectAll();
		boolean bl=false;
		for (User user1 : list) {
			if(username.equals(user1.getUsername())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该用户已存在!");
				bl=true;
				break;
			}
		}
		if(!bl) {
			User user=new User();
			int roleid1=Integer.parseInt(roleid);
			int wId1=Integer.parseInt(wId);
			user.setRoleid(roleid1);
			user.setwId(wId1);
			user.setUsername(username);
			user.setPassword(password);
			user.setName(name);
			user.setEmail(email);
			user.setPhone(phone);
			
			boolean bool=userService.insertSelective(user);
			if(bool) {
				messageBean.setMsg("添加成功");
				messageBean.setSuccess(true);
			}else {
				messageBean.setMsg("添加失败");
				messageBean.setSuccess(false);
			}
			
		}
		
		
		
		return messageBean;
	}
	
	@RequestMapping("/user/insertUser")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		List<Workteam> list=workteamService.selectAll();
		view.addObject("list", list);
		view.setViewName("user/insertUser");
		return view;
	}
	
	
	//删除指定用户
	@RequestMapping("/user/delete")
	@ResponseBody
	public MessageBean delete(HttpSession session,String userId) {
		MessageBean messageBean=new MessageBean("");
		int userid=Integer.parseInt(userId);
		User user=userService.selectByPrimaryKey(userid);
		boolean bool=false;
		int roleid=(int)session.getAttribute("roleid");
		if(user.getRoleid()<roleid) {
				messageBean.setMsg("您权限不足!");
			
		}else {
			bool=userService.deleteByUserid(userid);
			messageBean.setMsg("删除成功");
		}
		
		messageBean.setSuccess(bool);
		return messageBean;
		
	}
	
	
	//根据userid更改数据
	@RequestMapping("/user/update")
	@ResponseBody
	public MessageBean update(String userid,String roleid,String wId,String username,String name,String email,String phone,String oldusername) {
		MessageBean messageBean=new MessageBean("");
		List<User> list=userService.selectAll();
		boolean bl=false;
		for (User user1 : list) {
			if(username.equals(user1.getUsername())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该用户已存在!");
				bl=true;
				break;
			}
		}
		
		if(oldusername.equals(username)) {
			bl=false;
		}
	
		if(!bl) {
				int userId=Integer.parseInt(userid);
				int roleId=Integer.parseInt(roleid);
				int wid=Integer.parseInt(wId);
				User user=new User();
				user.setUserid(userId);
				user.setRoleid(roleId);
				user.setwId(wid);
				user.setUsername(username);
				user.setName(name);
				user.setEmail(email);
				user.setPhone(phone);
				boolean bool=userService.updateByPrimaryKeySelective(user);
				if(bool) {
					messageBean.setMsg("修改成功");
				}else {
					messageBean.setMsg("修改失败!");
				}
				System.out.println(bool);
				messageBean.setSuccess(bool);
			
		}
		
		return messageBean;
		
	}
	
	
	
	

}

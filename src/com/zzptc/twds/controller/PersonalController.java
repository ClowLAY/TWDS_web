package com.zzptc.twds.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzptc.twds.pojo.User;
import com.zzptc.twds.service.UserService;
import com.zzptc.twds.utils.MessageBean;


@Controller
public class PersonalController {
	

	@Autowired
	private UserService userService;
	
	@RequestMapping("/personal/updatePasswordView")
	public ModelAndView updatePasswordView(HttpServletRequest request) {
		ModelAndView view=new ModelAndView();
		view.setViewName("user/updatePassword");
		
		return view;
	}
	
	
	//修改用户密码
	@RequestMapping("/personal/updatePassword")
	@ResponseBody
	public MessageBean updatePassword(HttpServletRequest request,HttpSession session,String oldpassword,String newpassword,String newpassword1) {
		MessageBean messageBean=new MessageBean("");
		boolean bool=false;
		User user=new User();
		String username=(String) session.getAttribute("username");
		System.out.println("---"+username);
		user.setUsername(username);
		user.setPassword(oldpassword);
		user=userService.selectUserAndPassword(user);
		if(user!=null) {
			user.setPassword(newpassword);
			boolean bool1=userService.updateByPrimaryKeySelective(user);
			if(bool1) {
				messageBean.setMsg("修改成功");
				bool=true;
			}else {
				messageBean.setMsg("修改失败");
			}
			
			
		}else {
			messageBean.setMsg("密码错误");
			
		//	System.out.println("密码错误！");
		}
		messageBean.setSuccess(bool);
		return messageBean;
	}

}

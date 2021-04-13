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
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.service.CollegeService;
import com.zzptc.twds.service.WorkteamService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/workteam")
public class WorkteamController {

	
	@Autowired
	private WorkteamService workteamService;
	
	@Autowired
	private CollegeService collegeService;
	
	@RequestMapping("/insertView")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		List<College> list=collegeService.selectAll();
		view.addObject("list", list);
		view.setViewName("workteam/addWorkteam");
		return view;
	}
	
	/*
	 * 添加教研室
	 * */
	@RequestMapping("/insert")
	@ResponseBody
	public MessageBean insert(HttpServletRequest request,String cId,String workName) {
		MessageBean messageBean=new MessageBean("");
		int cId1=Integer.parseInt(cId);
		List<Workteam> list=workteamService.selectAll();
		boolean bl=false;
		for (Workteam workteam1 : list) {
			if(workName.equals(workteam1.getWorkName())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该教研室已存在!");
				bl=true;
				break;
			}
		}
		if(!bl) {
			Workteam workteam=new Workteam();
			workteam.setcId(cId1);
			workteam.setWorkName(workName);
			boolean bool=workteamService.insert(workteam);
			if(bool) {
				messageBean.setSuccess(true);
				messageBean.setMsg("添加成功");
			}else {
				messageBean.setSuccess(false);
				messageBean.setMsg("添加失败");
			}
		}
		
		return messageBean;
	
	}
	
	//查询全部教研室
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		User user=(User)session.getAttribute("user");
		if(user.getRoleid()==3) {
			Workteam workteam=workteamService.selectBywId(user.getwId());
			List<Workteam> list=workteamService.selectBycId(workteam.getcId());
			view.addObject("list", list);
			
		}else {
			List<Workteam> list=workteamService.selectAll();
			view.addObject("list", list);
		}
		
		view.setViewName("workteam/workteam");
		return view;
	}
	
	
	//查询全部教研室
	@RequestMapping("/selectAllworkteam")
	@ResponseBody
	public List<Workteam> selectByUserid() {
		MessageBean messageBean=new MessageBean("");
		List<Workteam> list1=workteamService.selectAll();
		/*messageBean.setOther(list1);
		messageBean.setSuccess(true);	*/	
		return list1;
	}
	
	
	//删除指定教研室
	@RequestMapping("/delete")
	@ResponseBody
	public MessageBean delete(String workName) {
		
		MessageBean messageBean=new MessageBean("");
		boolean bool=workteamService.deleteByworkName(workName);
		messageBean.setSuccess(bool);
		return messageBean;
		
	}
	
	//修改指定教研室数据
		@RequestMapping("/update")
		@ResponseBody
		public MessageBean update(String workName,String cId,String olkdWorkName) {
			MessageBean messageBean=new MessageBean("");
			List<Workteam> list=workteamService.selectAll();
			boolean bl=false;
			for (Workteam workteam1 : list) {
				if(workName.equals(workteam1.getWorkName())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该教研室已存在!");
					bl=true;
					break;
				}
			}
			if(workName.equals(olkdWorkName)) {
				bl=false;
			}
			if(!bl) {
				Workteam workteam=workteamService.selectByWorkName(olkdWorkName);
				
				if(workteam!=null) {
					int cid=Integer.parseInt(cId);
					workteam.setcId(cid);
					workteam.setWorkName(workName);
					boolean bool=workteamService.updateBywId(workteam);
					if(!bool) {
						messageBean.setMsg("修改失败!");
					}
					System.out.println(bool);
					messageBean.setSuccess(bool);
				}
				
			}
			
			return messageBean;
			
		}
	
}

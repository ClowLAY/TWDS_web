package com.zzptc.twds.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzptc.twds.pojo.College;
import com.zzptc.twds.pojo.Courses;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.service.CollegeService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/college")
public class CollegeController {

	@Autowired
	private CollegeService collegeService;
	
	//查询全部二级学院
	@RequestMapping("/selectAll")
	public  ModelAndView selectAll() {
		ModelAndView view=new ModelAndView();
		List<College> list=collegeService.selectAll();
		view.addObject("list", list);
		view.setViewName("college/college");
		return view;
	}
	
	
	//查询全部学院
		@RequestMapping("/selectAllCollege")
		@ResponseBody
		public List<College> selectAllCollege() {
			List<College> list=collegeService.selectAll();
			return list;
		}
	
	
	
	/*
	 *添加二级学院
	 * */
	@RequestMapping("/insert")
	@ResponseBody
	public MessageBean insert(HttpServletRequest request,String cName) {
		MessageBean messageBean=new MessageBean("");
		List<College> list=collegeService.selectAll();
		boolean bl=false;
		for (College college1 : list) {
			if(cName.equals(college1.getcName())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该二级学院已存在!");
				bl=true;
				break;
			}
		}
		if(!bl) {
			College college=new College();
			college.setcName(cName);
			boolean bool=collegeService.insertSelective(college);
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
	
	@RequestMapping("/insertView")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		view.setViewName("college/addCollege");
		return view;
	}
	

	//删除指定用户
	@RequestMapping("/delete")
	@ResponseBody
	public MessageBean delete(String cId) {
		MessageBean messageBean=new MessageBean("");
		int cid=Integer.parseInt(cId);
		boolean bool=collegeService.deleteByPrimaryKey(cid);
		messageBean.setSuccess(bool);
		return messageBean;
		
	}
	
	
	//根据cId更改数据
		@RequestMapping("/update")
		@ResponseBody
		public MessageBean update(String cId,String cName) {
			MessageBean messageBean=new MessageBean("");
			List<College> list=collegeService.selectAll();
			boolean bl=false;
			for (College college1: list) {
				if(cName.equals(college1.getcName())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该学院已存在!");
					bl=true;
					break;
				}
			}
		
			if(!bl) {
					College college=new College();
					int cid=Integer.parseInt(cId);
					college.setcId(cid);
					college.setcName(cName);
					
					boolean bool=collegeService.updateByPrimaryKeySelective(college);
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

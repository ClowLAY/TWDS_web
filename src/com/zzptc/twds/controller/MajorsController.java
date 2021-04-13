package com.zzptc.twds.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzptc.twds.pojo.Classes;
import com.zzptc.twds.pojo.College;
import com.zzptc.twds.pojo.Majors;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.service.CollegeService;
import com.zzptc.twds.service.MajorService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/major")
public class MajorsController {
	@Autowired
	private MajorService majorService;

	@Autowired
	private CollegeService collegeService;
	
	@RequestMapping("/insertView")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		List<College> list=collegeService.selectAll();
		view.addObject("list", list);
		view.setViewName("major/addmajor");
		return view;
	}
	
	/*
	 * 添加专业
	 * */
	@RequestMapping("/insert")
	@ResponseBody
	public MessageBean insert(HttpServletRequest request,String mname,String cId) {
		MessageBean messageBean=new MessageBean("");
		int cId1=Integer.parseInt(cId);
		List<Majors> list=majorService.selectAll();
		boolean bl=false;
		for (Majors majors : list) {
			if(mname.equals(majors.getMname())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该专业已存在!");
				bl=true;
				break;
			}
		}
		if(!bl) {
			Majors majors=new Majors();
			majors.setcId(cId1);
			majors.setMname(mname);
			boolean bool=majorService.insertSelective(majors);
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
	
	//查询全部专业
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		
			List<Majors> list=majorService.selectAll();
			view.addObject("list", list);
		
		
		view.setViewName("major/majors");
		return view;
	}
	
	

	//查询全部班级
	@RequestMapping("/selectAllMajor")
	@ResponseBody
	public List<Majors> selectAllClasses(HttpSession session) {
		List<Majors> list=majorService.selectAll();
		
		return list;
	}
	
	//删除指定专业
	@RequestMapping("/delete")
	@ResponseBody
	public MessageBean delete(String mid) {
		
		MessageBean messageBean=new MessageBean("");
		int mid1=Integer.parseInt(mid);
		boolean bool=majorService.deleteByPrimaryKey(mid1);
		messageBean.setSuccess(bool);
		return messageBean;
		
	}
	
	//修改指定专业数据
		@RequestMapping("/update")
		@ResponseBody
		public MessageBean update(String mname,String cId,String olkdMname,String mId) {
			MessageBean messageBean=new MessageBean("");
			List<Majors> list=majorService.selectAll();
			boolean bl=false;
			for (Majors majors : list) {
				if(mname.equals(majors.getMname())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该专业已存在!");
					bl=true;
					break;
				}
			}
			if(mname.equals(olkdMname)) {
				bl=false;
			}
			if(!bl) {
				
					int cid=Integer.parseInt(cId);
					int mid=Integer.parseInt(mId);
					Majors majors=new Majors();
					majors.setcId(cid);
					majors.setMid(mid);
					majors.setMname(mname);
					boolean bool=majorService.updateByPrimaryKey(majors);
					if(!bool) {
						messageBean.setMsg("修改失败!");
					}else {
						messageBean.setMsg("修改成功!");
					}
					System.out.println(bool);
					messageBean.setSuccess(bool);
				
			}
			
			return messageBean;
			
		}
		
		
		
	
}

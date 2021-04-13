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
import com.zzptc.twds.pojo.Majors;
import com.zzptc.twds.service.ClassesService;
import com.zzptc.twds.service.MajorService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/classes")
public class ClassesController {
	
	@Autowired
	private ClassesService classesService;

	@Autowired
	private MajorService majorService;

	
	//查询全部班级
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		List<Classes> list=classesService.selectAllClasses();
		
		view.addObject("list", list);
		view.setViewName("classes/classes");
		return view;
	}
	
	
	//查询全部班级
		@RequestMapping("/selectAllClasses")
		@ResponseBody
		public List<Classes> selectAllClasses(HttpSession session) {
			List<Classes> list=classesService.selectAllClasses();
			
			return list;
		}
		
	
	
	//添加班级
	@RequestMapping("/addClassView")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		List<Majors> list=majorService.selectAll();
		view.addObject("list", list);
		view.setViewName("classes/addClasses");
		return view;
	}
	
	
	/*
	 * 添加班级
	 * */
	@RequestMapping("/insert")
	@ResponseBody
	public MessageBean insert(HttpServletRequest request,String mid,String clName,String clYear,String clNum) {
		MessageBean messageBean=new MessageBean("");
		int mId=Integer.parseInt(mid);
		int clNum1=Integer.parseInt(clNum);
		List<Classes> list=classesService.selectAll();
		boolean bl=false;
		for (Classes classes : list) {
			if(clName.equals(classes.getClName())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该班级已存在!");
				bl=true;
				break;
			}
		}
		if(!bl) {
			Classes classes=new Classes();
			classes.setMid(mId);
			classes.setClName(clName);
			classes.setClYear(clYear);
			classes.setClNum(clNum1);
			
			
			boolean bool=classesService.insertSelective(classes);
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
	

	
	

	
	
	//删除指定班级
	@RequestMapping("/delete")
	@ResponseBody
	public MessageBean delete(String clId) {
		
		MessageBean messageBean=new MessageBean("");
		int clId1=Integer.parseInt(clId);
		boolean bool=classesService.deleteByPrimaryKey(clId1);
		messageBean.setSuccess(bool);
		return messageBean;
		
	}
	
	//修改指定班级数据
		@RequestMapping("/update")
		@ResponseBody
		public MessageBean update(String clName,String clId,String mId,String clYear,String clNum,String olkdclName) {
			MessageBean messageBean=new MessageBean("");
			List<Classes> list=classesService.selectAll();
			boolean bl=false;
			for (Classes classes : list) {
				if(clName.equals(classes.getClName())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该班级已存在!");
					bl=true;
					break;
				}
			}
			if(clName.equals(olkdclName)) {
				bl=false;
			}
			if(!bl) {
				
					int clId1=Integer.parseInt(clId);
					int mid=Integer.parseInt(mId);
					int clNum1=Integer.parseInt(clNum);
					Classes classes=new Classes();
					classes.setMid(mid);
					classes.setClId(clId1);
					classes.setClName(clName);
					classes.setClYear(clYear);
					classes.setClNum(clNum1);
					boolean bool=classesService.updateByPrimaryKeySelective(classes);
					if(!bool) {
						messageBean.setMsg("修改失败!");
					}else {
						messageBean.setMsg("修改成功!");
					}
					messageBean.setSuccess(bool);
				
			}
			
			return messageBean;
			
		}
}
	



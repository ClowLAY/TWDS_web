package com.zzptc.twds.controller;

import java.util.ArrayList;
import java.util.Collection;
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
import com.zzptc.twds.pojo.Courses;
import com.zzptc.twds.pojo.TCourses;
import com.zzptc.twds.pojo.Toworkload;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Xparam;
import com.zzptc.twds.pojo.Yparam;
import com.zzptc.twds.service.ClassesService;
import com.zzptc.twds.service.CollegeService;
import com.zzptc.twds.service.CoursesService;
import com.zzptc.twds.service.TCoursesService;
import com.zzptc.twds.service.ToworkloadService;
import com.zzptc.twds.service.XparamService;
import com.zzptc.twds.service.YparamService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/tCourses")
public class TCoursesController {

	@Autowired
	private TCoursesService tCoursesService;
	
	
	@Autowired
	private CoursesService coursesService;
	
	@Autowired
	private ClassesService classesService;
	
	@Autowired
	private ToworkloadService toworkloadService;
	
	@Autowired
	private XparamService xparamService;
	
	@Autowired
	private YparamService yparamService;
	
	//填充老师申报工作量页面(视图)
	@RequestMapping("/addDeclareTCoursesView")
	public ModelAndView addDeclareTCoursesView(HttpSession session,String coId) {
		ModelAndView view=new ModelAndView();
		int coId1=Integer.parseInt(coId);
		Courses courses=coursesService.selectByPrimaryKey(coId1);//根据课程名查询课程
		String name=((User)session.getAttribute("user")).getName();
		int userid=((User) session.getAttribute("user")).getUserid();
		List<TCourses> list=tCoursesService.selectAllTCoursesByUserid(userid);
		for (TCourses tCourses : list) {
			if(tCourses.getCoId()==coId1) {
				view.addObject("Classes",tCourses.getClasses());
				break;
			}
		}
		
		view.addObject("list", list);
		view.addObject("name",name);
		view.addObject("courses", courses);
		view.setViewName("tCourses/addTCourses");
		return view;
	}
	
	
	//老师申报课程(视图)
		@RequestMapping("/DeclareTCoursesView")
		public ModelAndView insertView(HttpSession session) {
			ModelAndView view=new ModelAndView();
			String name=((User)session.getAttribute("user")).getName();
			view.addObject("name",name);
			int userid=((User) session.getAttribute("user")).getUserid();
			List<TCourses> list=tCoursesService.selectAllTCoursesByUserid(userid);
			view.addObject("list", list);
			view.setViewName("tCourses/addTCourses");
			return view;
		}
		
	
	
	//查询当前用户教学工作量和其它工作量
		@RequestMapping("/selectAll")
		public ModelAndView selectAll(HttpSession session) {
			ModelAndView view=new ModelAndView();
			
			int userid=((User) session.getAttribute("user")).getUserid();
			List<TCourses> list =tCoursesService.selectAllTCoursesByUserid(userid);
			List<Toworkload> listToworkload=toworkloadService.selectByUserId(userid);
			
			double totalworkload=0;//其它工作量和教学工作量的和
			
			//计算其它工作量和
			double totalOworkload=0;
			for (Toworkload toworkload : listToworkload) {
				totalOworkload+=toworkload.getOworkload().getOvalue();
			}
			
			//List<Double> totalTworkload=new ArrayList<>();
			//计算教学工作量值
			
			int  i=0;
			for (TCourses tCourses : list) {
				List<Xparam> listXparam=xparamService.selectAll(tCourses.getCourses().getFid());
				
				//班级或教学组织形式校正系数
				double	xValue=0;
				if(listXparam.size()!=0) {
					if(i>=listXparam.size()) {
						i=listXparam.size()-1;
					}
					xValue=listXparam.get(i).getValue();
				}
				i++;
				
				
				
				//授课人数校正系数
				List<Yparam> listYparam=yparamService.selectAll(tCourses.getCourses().getFid());
				
				double yValue=0;
				for (Yparam yparam : listYparam) {
					if(tCourses.getClasses().getClNum()>=yparam.getFloor()&&tCourses.getClasses().getClNum()<yparam.getToplimit()) {
						yValue=yparam.getValue();
						break;
					}
				}
				tCourses.setTotalTworkload(tCourses.getCourses().getCoTotal()*xValue*yValue);
				
				//Classes classes=classesService.selectByPrimaryKey(tCourses.getClId());
				totalworkload+=tCourses.getCourses().getCoTotal()*xValue*yValue;
				
			}
			totalworkload+=totalOworkload;
			view.addObject("listToworkload", listToworkload);
			view.addObject("totalOworkload", totalOworkload);
			view.addObject("totalworkload", totalworkload);
			view.addObject("list", list);
			view.addObject("size", list.size());
			view.setViewName("tCourses/TWorkLoad");
			return view;
		}
		
		
		

		//查询全部用户教学工作量
			@RequestMapping("/selectAllTworkload")
			public ModelAndView selectAllTCourses(HttpSession session) {
				ModelAndView view=new ModelAndView();
				List<TCourses> list =tCoursesService.selectAllTCourses();
				List<TCourses> listTCourses=new ArrayList<>();
				List<Integer> str=new ArrayList<>();
				for (TCourses tCourses : list) {
					boolean bool=false;
					for (int i : str) {
						if(tCourses.getUserid()==i) {
							bool=true;
							break;
						}
					}
					if(!bool) {
						
						
						//List<Double> totalTworkload=new ArrayList<>();
						//计算教学工作量值
						List<TCourses> list1 =tCoursesService.selectAllTCoursesByUserid(tCourses.getUserid());
						int  i=0;
						for (TCourses tCourses1 : list1) {
							TCourses tCourses2=new TCourses();
							
						
							
							List<Xparam> listXparam=xparamService.selectAll(tCourses.getCourses().getFid());
							
							//班级或教学组织形式校正系数
							double	xValue=0;
							if(listXparam.size()!=0) {
								if(i>=listXparam.size()) {
									i=listXparam.size()-1;
								}
								xValue=listXparam.get(i).getValue();
							}
							i++;
							tCourses2.setXvalue(xValue);
							
							
							//授课人数校正系数
							List<Yparam> listYparam=yparamService.selectAll(tCourses1.getCourses().getFid());
							
							double yValue=0;
							for (Yparam yparam : listYparam) {
								if(tCourses1.getClasses().getClNum()>=yparam.getFloor()&&tCourses1.getClasses().getClNum()<yparam.getToplimit()) {
									yValue=yparam.getValue();
									break;
								}
							}
							tCourses2.setYvalue(yValue);
							tCourses2.setTotalTworkload(tCourses1.getCourses().getCoTotal()*xValue*yValue);
							tCourses2.setTid(tCourses1.getTid());
							tCourses2.setClasses(tCourses1.getClasses());
							tCourses2.setFormula(tCourses1.getFormula());
							tCourses2.setCourses(tCourses1.getCourses());
							tCourses2.setUser(tCourses1.getUser());
							
						
							listTCourses.add(tCourses2);
						}
				
						str.add(tCourses.getUserid());
					}
					
				}
				
				
				view.addObject("listTCourses", listTCourses);
				view.setViewName("tCourses/allTworkload");
				return view;
			}
		

			//查询全部用户其它工作量值
				@RequestMapping("/selectAllOworkload")
				public ModelAndView selectAllOworkload(HttpSession session) {
					ModelAndView view=new ModelAndView();
					List<Toworkload> listOworkload=toworkloadService.selectAllToworkload();
					
					view.addObject("listOworkload", listOworkload);
					view.setViewName("Oworkload/allOworkload");
					return view;
				}
			
			
			
			
		//给老师分配课程
		
		@RequestMapping("/insert")
		@ResponseBody
		public MessageBean insert(HttpServletRequest request,HttpSession session,String coId,String clId,String userid){
			MessageBean messageBean=new MessageBean("");
			List<TCourses> list=tCoursesService.selectAll();
			int coId1=Integer.parseInt(coId);
			Courses courses=coursesService.selectByPrimaryKey(coId1);
			boolean bl=false;
			
			for (TCourses tCourses : list) {
				if(courses.getCoId().equals(tCourses.getCoId())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该课程已分配!");
					bl=true;
					break;
				}
			}
			if(!bl) {
				int clId1=Integer.parseInt(clId);
				int  userid1=Integer.parseInt(userid);
				TCourses tCourses=new TCourses();
				tCourses.setClId(clId1);
				tCourses.setCoId(courses.getCoId());
				tCourses.setUserid(userid1);
				boolean bool=tCoursesService.insertSelective(tCourses);
				if(bool) {
					Courses courses1=new Courses();
					courses1.setCoId(tCourses.getCoId());
					courses1.setState("1");
					bool=coursesService.updateByPrimaryKeySelective(courses1);
					
					messageBean.setSuccess(true);
					messageBean.setMsg("添加成功");
				}else {
					messageBean.setSuccess(false);
					messageBean.setMsg("添加失败");
				}
			}
		
			return messageBean;
		
		}
		

		//删除指定数据
		@RequestMapping("/delete")
		@ResponseBody
		public MessageBean delete(String tid) {
			MessageBean messageBean=new MessageBean("");
			int tid1=Integer.parseInt(tid);
			TCourses tCourses=tCoursesService.selectByPrimaryKey(tid1);
			Courses courses=new Courses();
			courses.setCoId(tCourses.getCoId());
			courses.setState("0");
			boolean bool=tCoursesService.deleteByPrimaryKey(tid1);
			if(bool) {
				bool=coursesService.updateByPrimaryKeySelective(courses);
			}
			messageBean.setSuccess(bool);
			return messageBean;
			
		}
		
		
		//更改数据
				@RequestMapping("/update")
				@ResponseBody
				public MessageBean update(String tid,String userid,String clid) {
					MessageBean messageBean=new MessageBean("");
					
					TCourses tCourses=new TCourses();
					tCourses.setTid(Integer.parseInt(tid));
					tCourses.setUserid(Integer.parseInt(userid));
					tCourses.setClId(Integer.parseInt(clid));
							
					boolean bool=tCoursesService.updateByPrimaryKeySelective(tCourses);
					if(bool) {
						messageBean.setMsg("修改成功");
					}else {
						messageBean.setMsg("修改失败!");
					}
				//	System.out.println(bool);
					messageBean.setSuccess(bool);
						
					
					return messageBean;
					
				}
		
		
		
		
	
}

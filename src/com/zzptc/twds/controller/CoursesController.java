package com.zzptc.twds.controller;

import java.io.UnsupportedEncodingException;
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
import com.zzptc.twds.pojo.Formula;
import com.zzptc.twds.pojo.Majors;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.service.ClassesService;
import com.zzptc.twds.service.CollegeService;
import com.zzptc.twds.service.CoursesService;
import com.zzptc.twds.service.FormulaService;
import com.zzptc.twds.service.MajorService;
import com.zzptc.twds.service.UserService;
import com.zzptc.twds.service.WorkteamService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/courses")
public class CoursesController {

	
	@Autowired
	private CollegeService collegeService;

	@Autowired
	private FormulaService formulaService;
	
	@Autowired
	private CoursesService coursesService;
	
	
	@Autowired
	private ClassesService classesService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkteamService workteamService;
	
	//查询全部课程
	@RequestMapping("/selectAllCoures")
	@ResponseBody
	public List<Courses> selectAll() {
		Courses courses1=new Courses();	
		List<Courses> list=coursesService.selectAllCourses(courses1);
		return list;
	}
	
	
	

	//查询全部课程
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		User user=(User)session.getAttribute("user");
		if(user.getRoleid()==3) {
			Workteam workteam=workteamService.selectBywId(user.getwId());
			Courses courses1=new Courses();	
			courses1.setcId(workteam.getcId());
			List<Courses> list=coursesService.selectAllCoursesBycId(courses1);
			
			view.addObject("list", list);
		}else {
			List<College> listCollege=collegeService.selectAll();
			Courses courses1=new Courses();	
			List<Courses> list=coursesService.selectAllCourses(courses1);
			view.addObject("listCollege", listCollege);
			view.addObject("list", list);
		}
		
		
		
		view.addObject("roleId", user.getRoleid());
		view.setViewName("courses/courses");
		return view;
	}
	
	
	//通过学院查询课程
	@RequestMapping("/selectAllBycId")
	public ModelAndView selectAllBycId(HttpSession session,String cId,String coTerm1) {
		ModelAndView view=new ModelAndView();
		Courses courses1=new Courses();	
			try {
				cId=new String(cId.getBytes("ISO-8859-1"),"UTF-8");
				if(!coTerm1.equals("")) {
					coTerm1=new String(coTerm1.getBytes("ISO-8859-1"),"UTF-8");
					courses1.setCoTerm(coTerm1);
				}
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		
			if(cId.equals("全部")) {
				
				List<Courses> list=coursesService.selectAllCourses(courses1);
				List<College> listCollege=collegeService.selectAll();
				view.addObject("listCollege", listCollege);
				view.addObject("list", list);
			}else {
				
				courses1.setcId(Integer.parseInt(cId));
				List<Courses> list=coursesService.selectAllCoursesBycId(courses1);
				List<College> listCollege=collegeService.selectAll();
				view.addObject("listCollege", listCollege);
				view.addObject("list", list);
				view.addObject("cId", cId);
			}
			
		
	
		view.setViewName("courses/courses");
		return view;
	}
	

	//通过开课学期查询课程
	@RequestMapping("/selectAllBycoTerm")
	public ModelAndView selectAllBycoTerm(HttpSession session,String coTerm,String cId) {
		ModelAndView view=new ModelAndView();
		User user=(User)session.getAttribute("user");
		Courses courses=new Courses();
		try {
			coTerm=new String(coTerm.getBytes("ISO-8859-1"),"UTF-8");
			
		
			if(user.getRoleid()==3) {
				Workteam workteam=workteamService.selectBywId(user.getwId());
				
				courses.setCoTerm(coTerm);
				courses.setcId(workteam.getcId());
				List<Courses> list=coursesService.selectBycoTerm(courses);
				view.addObject("coTerm", coTerm);
				view.addObject("list", list);
			}else {
				System.out.println("----cId"+cId);
				cId=new String(cId.getBytes("ISO-8859-1"),"UTF-8");
				if(!cId.equals("全部")) {
					courses.setcId(Integer.parseInt(cId));
				}
				
				courses.setCoTerm(coTerm);
				
				List<Courses> list=coursesService.selectBycoTerm(courses);
				List<College> listCollege=collegeService.selectAll();
				view.addObject("listCollege", listCollege);
				view.addObject("list", list);
				view.addObject("coTerm", coTerm);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		view.addObject("roleId", user.getRoleid());
		view.setViewName("courses/courses");
		return view;
	}
	

	
	//添加课程页面
	@RequestMapping("/addCoursesView")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		List<College> list=collegeService.selectAll();
		List<Formula> listFor=formulaService.selectAll();
		view.addObject("list", list);
		view.addObject("listFor", listFor);
		view.setViewName("courses/addCourses");
		return view;
	}
	
	/*
	 * 添加课程
	 * */
	@RequestMapping("/insert")
	@ResponseBody
	public MessageBean insert(HttpServletRequest request,String cId,String fid,String coName,String coType,String coWeek,String coWenum,String coTotal,String coTerm ) {
		MessageBean messageBean=new MessageBean("");
		int cId1=Integer.parseInt(cId);
		int fid1=Integer.parseInt(fid);
		Double coWeek1=Double.parseDouble(coWeek);
		Double coTotal1=Double.parseDouble(coTotal);
		int coWenum1=Integer.parseInt(coWenum);
		Courses courses1=new Courses();
		List<Courses> list=coursesService.selectAllCourses(courses1);
		boolean bl=false;
		if(coType.equals("专业课")) {
			
			for (Courses courses : list) {
				if(coName.equals(courses.getCoName())&&coTerm.equals(courses.getCoTerm())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该课程已存在!");
					bl=true;
					break;
				}
			}
		}else if(coType.equals("公开课")){
			for (Courses courses : list) {
				if(coName.equals(courses.getCoName())&&(cId1==(courses.getcId()))&&coTerm.equals(courses.getCoTerm())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该课程已存在!");
					bl=true;
					break;
				}
			}
		}
		
		if(!bl) {
			Courses courses=new Courses();
			courses.setcId(cId1);
			courses.setFid(fid1);
			courses.setCoName(coName);
			courses.setCoType(coType);
			courses.setCoWeek(coWeek1);
			courses.setCoWenum(coWenum1);
			courses.setCoTotal(coTotal1);
			courses.setCoTerm(coTerm);
			
			
			boolean bool=coursesService.insertSelective(courses);
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
	
	//删除指定课程
		@RequestMapping("/delete")
		@ResponseBody
		public MessageBean delete(String coId) {
			
			MessageBean messageBean=new MessageBean("");
			int coId1=Integer.parseInt(coId);
			boolean bool=coursesService.deleteByPrimaryKey(coId1);
			messageBean.setSuccess(bool);
			return messageBean;
			
		}
		
		//修改指定课程数据
				@RequestMapping("/update")
				@ResponseBody
				public MessageBean update(String coId,String cId,String fid,String coName,String coType,String coWeek,String coWenum,String coTotal,String coTerm,String oldcoName) {
					MessageBean messageBean=new MessageBean("");
					
					int coId1=Integer.parseInt(coId);
					int cId1=Integer.parseInt(cId);
					int fid1=Integer.parseInt(fid);
					Double coWeek1=Double.parseDouble(coWeek);
					Double coTotal1=Double.parseDouble(coTotal);
					int coWenum1=Integer.parseInt(coWenum);
					Courses courses1=new Courses();
					List<Courses> list=coursesService.selectAllCourses(courses1);
					boolean bl=false;
					if(coType.equals("专业课")) {
						
						for (Courses courses : list) {
							if(coName.equals(courses.getCoName())) {
								messageBean.setSuccess(false);
								messageBean.setMsg("该课程已存在!");
								bl=true;
								break;
							}
						}
					}else if(coType.equals("公开课")){
						for (Courses courses : list) {
							if(coName.equals(courses.getCoName())&&cId1==courses.getcId()) {
								messageBean.setSuccess(false);
								messageBean.setMsg("该课程已存在!");
								bl=true;
								break;
							}
						}
					}
					if(coName.equals(oldcoName)) {
						bl=false;
					}
					if(!bl) {
						
						Courses courses=new Courses();
						courses.setCoId(coId1);
						courses.setcId(cId1);
						courses.setFid(fid1);
						courses.setCoName(coName);
						courses.setCoType(coType);
						courses.setCoWeek(coWeek1);
						courses.setCoWenum(coWenum1);
						courses.setCoTotal(coTotal1);
						courses.setCoTerm(coTerm);
							boolean bool=coursesService.updateByPrimaryKeySelective(courses);
							if(!bool) {
								messageBean.setMsg("修改失败!");
							}else {
								messageBean.setMsg("修改成功!");
							}
							//System.out.println(bool);
							messageBean.setSuccess(bool);
						
					}
					
					return messageBean;
					
				}
				
				
				
				
				//填充分配课程页面(视图)
				@RequestMapping("/addDisCoursesView")
				public ModelAndView addDeclareTCoursesView(HttpSession session,String coId,String userid) {
					ModelAndView view=new ModelAndView();
					Courses courses1=new Courses();
					courses1.setState("0");
					List<Classes> listClasses=classesService.selectAllClasses();
					List<Courses> listcourses=coursesService.selectAllCourses(courses1);
					List<User> listUser=userService.selectAll();
					int coId1=Integer.parseInt(coId);
					Courses courses=coursesService.selectByPrimaryKey(coId1);//根据课程名查询课程
					
					try {
						userid=new String(userid.getBytes("ISO-8859-1"),"UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(userid.equals("请选择任课老师")) {
						view.addObject("userid1","");
					}else {
						int  userid1=Integer.parseInt(userid);
						view.addObject("userid1",userid1);
					}
					
					view.addObject("listUser",listUser);
					view.addObject("listcourses", listcourses);
					view.addObject("courses", courses);
					view.addObject("listClasses", listClasses);
					view.setViewName("courses/DisCourses");
					return view;
				}
				
				
				//分配课程(视图)
					@RequestMapping("/DisCoursesView")
					public ModelAndView insertView(HttpSession session) {
						ModelAndView view=new ModelAndView();
						Courses courses=new Courses();
						courses.setState("0");
						List<Courses> listcourses=coursesService.selectAllCourses(courses);
						List<User> listUser=userService.selectAll();
						view.addObject("listcourses", listcourses);
						view.addObject("listUser",listUser);
						view.setViewName("courses/DisCourses");
						return view;
					}
					
					
	
}

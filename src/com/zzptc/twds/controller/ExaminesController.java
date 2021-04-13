package com.zzptc.twds.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzptc.twds.pojo.College;
import com.zzptc.twds.pojo.Courses;
import com.zzptc.twds.pojo.Examines;
import com.zzptc.twds.pojo.TCourses;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.Workteam;
import com.zzptc.twds.service.CollegeService;
import com.zzptc.twds.service.ExaminesService;
import com.zzptc.twds.service.TCoursesService;
import com.zzptc.twds.service.WorkteamService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/examines")
public class ExaminesController {

	@Autowired
	private ExaminesService examinesService;
	
	

	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private TCoursesService tCoursesService;
	
	
	@Autowired
	private WorkteamService workteamService;
	
	private String cId;
	
	//管理员审核老师申报课程页面
		@RequestMapping("/examinesDeclareView")
		public ModelAndView insertView(HttpSession session,String tid) {
			ModelAndView view=new ModelAndView();
			view.setViewName("examines/examines");
			return view;
		}
	
		/*
		 *月度教学工作量申报
		 * */
		@RequestMapping("/insert")
		@ResponseBody
		public MessageBean insert(HttpSession session,String weeks,String values,String coId) {
			MessageBean messageBean=new MessageBean("");
			int coId1=Integer.parseInt(coId);
			TCourses tCourses=tCoursesService.selectBycoId(coId1);//根据课程名查询课程
			String[] weeks1=weeks.split(",");
			String[] values1=values.split(",");
			int userid=((User) session.getAttribute("user")).getUserid();
			List<Examines> list=examinesService.selectAll(userid);
			boolean bl=false;
			for (Examines examines : list) {
					String	week=String.valueOf(examines.geteWeek());
					if(examines.getTid().equals(tCourses.getTid())&&weeks.contains(week)) {
						messageBean.setSuccess(false);
						messageBean.setMsg("该课程工作量已申请!");
						bl=true;
						break;
					}
				
			}
			
			
			if(!bl) {
				boolean bool=false;
				for(int i=0;i<weeks1.length;i++) {
					Examines examines=new Examines();
					examines.setTid(tCourses.getTid());
					examines.seteWeek(Integer.parseInt(weeks1[i]));
					examines.setValue(Double.parseDouble(values1[i]));
					SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date=simpleDateFormat.format(new Date());
					examines.setEtime(date);
					bool=examinesService.insertSelective(examines);
					
				}
				
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
		
		
		

		//已申报月度教学工作量申报汇总
			@RequestMapping("/MoWorkLoad")
			public ModelAndView MoWorkLoad(HttpSession session) {
				ModelAndView view=new ModelAndView();
				int userid=((User) session.getAttribute("user")).getUserid();
				List<Examines> list=examinesService.selectAll(userid);
				view.addObject("list", list);
				view.setViewName("examines/MoWorkLoad");
				return view;
			}
		
			
			//通过审核状态查询已申报月度教学工作量申报汇总
			@RequestMapping("/MoWorkLoadByResult")
			public ModelAndView MoWorkLoadByResult(HttpSession session,String result) {
				ModelAndView view=new ModelAndView();
				int userid=((User) session.getAttribute("user")).getUserid();
				try {
					result=new String(result.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(result.equals("全部")) {
					List<Examines> list=examinesService.selectAll(userid);
					view.addObject("list", list);
					
				}else {
					Examines examines=new Examines();
					examines.setResult(result);
					examines.setUserid(userid);
					List<Examines> list=examinesService.selectByresultandUserId(examines);
					view.addObject("list", list);
					view.addObject("result", result);
				}
				
				view.setViewName("examines/MoWorkLoad");
				return view;
			}
	/*
	 * 这个方法没有分页功能的
			//教师工工作量申报数据(待审核)
			@RequestMapping("/selectAllTCourses")
			public ModelAndView selectAllTCourses(HttpSession session,Examines examines) {
					ModelAndView view=new ModelAndView();
					
					
					User user=(User)session.getAttribute("user");
					if(user.getRoleid()==3) {
						Workteam workteam=workteamService.selectBywId(user.getwId());
						List<Examines> list=examinesService.selectAllByCld(workteam.getcId());
						view.addObject("list", list);
					}else {
						List<Examines> list=examinesService.selectAllByresult();
						List<College> listCollege=collegeService.selectAll();
						view.addObject("listCollege", listCollege);
						view.addObject("list", list);
					}
					view.addObject("roleId", user.getRoleid());
					view.setViewName("examines/StateExamine");
					return view;
			}*/
			
			//教师工工作量申报数据(待审核)
			@RequestMapping("/selectAllTCourses")
			public ModelAndView selectAllTCourses(HttpSession session,Examines examines) {
					User user=(User)session.getAttribute("user");
					ModelAndView view=new ModelAndView();
					if(user.getRoleid()!=3) {
						List<College> listCollege=collegeService.selectAll();
						view.addObject("listCollege", listCollege);
					}
					
					
					
					view.addObject("roleId", user.getRoleid());
					view.setViewName("examines/StateExamine");
					return view;
					
					
			}
			
			
			//教师工工作量申报数据(待审核)
			@RequestMapping("/selectAllTCourses1")
			@ResponseBody
			public Map selectAllTCourses1(HttpSession session,Examines examines) {
				User user=(User)session.getAttribute("user");
				
				Map<String,Object>  map=null;
				if(cId!=null) {
					try {
						cId=new String(cId.getBytes("ISO-8859-1"),"UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					if(cId.equals("全部")) {
						
					}else {
						examines.setcId(Integer.parseInt(cId));
						
					}
					
				}
				map=examinesService.selectAllByresult(examines,user);
				
				List<College> listCollege=collegeService.selectAll();
				map.put("listCollege",listCollege);
				cId=null;
				return map;
			}
			@RequestMapping("/selectAllTCoursesByCid")
			public ModelAndView selectAllTCoursesByCid(HttpSession session,String cid) {
				ModelAndView view=new ModelAndView();
				view.setViewName("examines/StateExamine");
				cId=cid;
				return view;
				
				
			}
			
			
			/*
			 * 
			 * //通过过学院查询教师工工作量申报数据(待审核)
			@RequestMapping("/selectAllTCoursesByCid")
			public ModelAndView selectAllTCoursesByCid(HttpSession session,String cId) {
					ModelAndView view=new ModelAndView();
					User user=(User)session.getAttribute("user");
					
					if(user.getRoleid()==3) {
						Workteam workteam=workteamService.selectBywId(user.getwId());
						List<Examines> list=examinesService.selectAllByCld(workteam.getcId());
						view.addObject("list", list);
					}else {
						try {
							cId=new String(cId.getBytes("ISO-8859-1"),"UTF-8");
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						if(cId.equals("全部")) {
							List<Examines> list=examinesService.selectAllByresult();
							
							view.addObject("list", list);
						}else {
							System.out.println("---cid="+cId);
							List<Examines> list=examinesService.selectAllByCld(Integer.parseInt(cId));
							view.addObject("list", list);
							view.addObject("cId", cId);
						}
						List<College> listCollege=collegeService.selectAll();
						view.addObject("listCollege", listCollege);
					}
					
					
					
					view.setViewName("examines/StateExamine");
					return view;
			}
			
			*
			*/

			//教师工工作量申报数据(已审核)
			@RequestMapping("/selectAllexamines")
			public ModelAndView selectAllexamines(HttpSession session) {
					ModelAndView view=new ModelAndView();
					User user=(User)session.getAttribute("user");
					if(user.getRoleid()==3) {
						Workteam workteam=workteamService.selectBywId(user.getwId());
						List<Examines> list=examinesService.selectAllByCld1(workteam.getcId());
						view.addObject("list", list);
					}else {
						List<Examines> list=examinesService.selectAllByresult1();
						List<College> listCollege=collegeService.selectAll();
						view.addObject("listCollege", listCollege);
						view.addObject("list", list);
					}
					view.addObject("roleId", user.getRoleid());
					view.setViewName("examines/Audited");
					return view;
			}
			
			
			
			//通过过学院查询教师工工作量申报数据(已审核)
			@RequestMapping("/selectAllexaminesByCid")
			public ModelAndView selectAllexaminesByCid(HttpSession session,String cId) {
					ModelAndView view=new ModelAndView();
					User user=(User)session.getAttribute("user");
					
					if(user.getRoleid()==3) {
						Workteam workteam=workteamService.selectBywId(user.getwId());
						List<Examines> list=examinesService.selectAllByCld1(workteam.getcId());
						view.addObject("list", list);
					}else {
						try {
							cId=new String(cId.getBytes("ISO-8859-1"),"UTF-8");
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						if(cId.equals("全部")) {
							List<Examines> list=examinesService.selectAllByresult1();
							view.addObject("list", list);
						}else {
							List<Examines> list=examinesService.selectAllByCld1(Integer.parseInt(cId));
							view.addObject("list", list);
							view.addObject("cId", cId);
						}
						List<College> listCollege=collegeService.selectAll();
						view.addObject("listCollege", listCollege);
					}
					
					
					view.setViewName("examines/Audited");
					return view;
			}
			

			//审核是否通过
			@RequestMapping("/update")
			@ResponseBody
			public MessageBean update(HttpSession session,String str,String result) {
					MessageBean messageBean=new MessageBean("");
					String[] strs=str.split(",");
					boolean bool=false;
					for (String eid : strs) {
						Examines examines=new Examines();
						examines.setEid(Integer.parseInt(eid));
						examines.setResult(result);
						bool=examinesService.updateByPrimaryKeySelective(examines);
					}
					messageBean.setSuccess(bool);
					messageBean.setMsg("修改成功");
					return messageBean;
			}
			
			
	
	
	
}

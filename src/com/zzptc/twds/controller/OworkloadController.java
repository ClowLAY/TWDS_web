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

import com.zzptc.twds.pojo.Oworkload;
import com.zzptc.twds.pojo.User;
import com.zzptc.twds.service.OworkloadService;
import com.zzptc.twds.service.UserService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/Oworkload")
public class OworkloadController {

	@Autowired
	private OworkloadService oworkloadService;
	
	@Autowired
	private UserService userService;
	
	//添加其它工作量页面
	@RequestMapping("/insertView")
	public ModelAndView insertView() {
		ModelAndView view=new ModelAndView();
		view.setViewName("Oworkload/addOworkload");
		return view;
	}
	
	/*
	 * 添加其它工作量
	 * */
	@RequestMapping("/insert")
	@ResponseBody
	public MessageBean insert(HttpServletRequest request,String otype,String ovalue) {
		MessageBean messageBean=new MessageBean("");
		double ovalue1=Double.parseDouble(ovalue);
		List<Oworkload> list=oworkloadService.selectAll();
		boolean bl=false;
		for (Oworkload oworkload : list) {
			if(otype.equals(oworkload.getOtype())) {
				messageBean.setSuccess(false);
				messageBean.setMsg("该类型工作量已存在!");
				bl=true;
				break;
			}
		}
		if(!bl) {
			Oworkload oworkload=new Oworkload();
			oworkload.setOtype(otype);
			oworkload.setOvalue(ovalue1);
			boolean bool=oworkloadService.insert(oworkload);
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
	
	//查询全部其它工作量
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		
		List<Oworkload> list=oworkloadService.selectAll();
		view.addObject("list", list);
		view.setViewName("Oworkload/Oworkload");
		return view;
	}
	
	//删除指定其它工作量
		@RequestMapping("/delete")
		@ResponseBody
		public MessageBean delete(String oid) {
			
			MessageBean messageBean=new MessageBean("");
			int oid1=Integer.parseInt(oid);
			boolean bool=oworkloadService.deleteByPrimaryKey(oid1);
			messageBean.setSuccess(bool);
			return messageBean;
			
		}
		
		//修改指定其它工作量数据
			@RequestMapping("/update")
			@ResponseBody
			public MessageBean update(String oid,String otype,String ovalue,String oldotype) {
				MessageBean messageBean=new MessageBean("");
				
				List<Oworkload> list=oworkloadService.selectAll();
				boolean bl=false;
				for (Oworkload oworkload : list) {
					if(otype.equals(oworkload.getOtype())) {
						messageBean.setSuccess(false);
						messageBean.setMsg("该类型工作量已存在!");
						bl=true;
						break;
					}
				}
				if(otype.equals(oldotype)) {
					bl=false;
				}
				if(!bl) {
					
						double ovalue1=Double.parseDouble(ovalue);
						int oid1=Integer.parseInt(oid);
						Oworkload oworkload=new Oworkload();
						oworkload.setOid(oid1);
						oworkload.setOtype(otype);
						oworkload.setOvalue(ovalue1);
						boolean bool=oworkloadService.updateByPrimaryKeySelective(oworkload);
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
			
			
			
			//分配其它工作量页面
			@RequestMapping("/DisOworkload")
			public ModelAndView DisOworkload(HttpSession session) {
				ModelAndView view=new ModelAndView();
				List<User> listUser=userService.selectAll();
				List<Oworkload> listOwork=oworkloadService.selectAll();
				
				view.addObject("listOwork", listOwork);
				view.addObject("listUser",listUser);
				view.setViewName("Oworkload/DisOworkload");
				return view;
			}
			

			//填充分配其它工作量页面
			@RequestMapping("/addDisOworkload")
			public ModelAndView addDisOworkload(HttpSession session,String oid,String userid) {
				ModelAndView view=new ModelAndView();
				List<Oworkload> listOwork=oworkloadService.selectAll();
				List<User> listUser=userService.selectAll();
				int oid1=Integer.parseInt(oid);
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
				Oworkload oworkload=oworkloadService.selectByPrimaryKey(oid1);
				view.addObject("listUser",listUser);
				view.addObject("oworkload", oworkload);
				view.addObject("listOwork", listOwork);
				view.setViewName("Oworkload/DisOworkload");
				return view;
			}
	
}

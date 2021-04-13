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
import com.zzptc.twds.pojo.Courses;
import com.zzptc.twds.pojo.Formula;
import com.zzptc.twds.pojo.Majors;
import com.zzptc.twds.pojo.Xparam;
import com.zzptc.twds.pojo.Yparam;
import com.zzptc.twds.service.FormulaService;
import com.zzptc.twds.service.XparamService;
import com.zzptc.twds.service.YparamService;
import com.zzptc.twds.utils.MessageBean;

@Controller
@RequestMapping("/formula")
public class FormulaController {

	@Autowired
	private FormulaService formulaService;
	
	@Autowired
	private XparamService xparamService;
	
	@Autowired
	private YparamService yparamService;
	

	//查询全部工作量计算公式
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpSession session) {
		ModelAndView view=new ModelAndView();
		List<Formula> list=formulaService.selectAll();
		view.addObject("list", list);
		view.setViewName("formula/formula");
		return view;
	}
	
	
	//查询全部工作量计算公式
		@RequestMapping("/selectAllFormula")
		@ResponseBody
		public List<Formula> selectAll() {
			List<Formula> list=formulaService.selectAll();
			return list;
		}
		
		
		//添加计算公式(视图)
		@RequestMapping("/addFormulaView")
		public ModelAndView insertView() {
			ModelAndView view=new ModelAndView();
			view.setViewName("formula/addformula");
			return view;
		}
		
		
		/*
		 * 添加公式与X记录值、Y记录值
		 * */
		@RequestMapping("/insert")
		@ResponseBody
		public MessageBean insert(HttpServletRequest request,String expression,String fname,String p1,String p2,String p3,String Xvalues,String Yvalues,String floors,String toplimits) {
			MessageBean messageBean=new MessageBean("");
			double P1=0;
			double P2=0;
			double P3=0;
			
			if(p1!=null&&!p1.equals("")) {
				P1=Double.parseDouble(p1);
			}
			if(p2!=null&&!p2.equals("")) {
				P2=Double.parseDouble(p2);
			}
			if(p3!=null&&!p3.equals("")) {
				P3=Double.parseDouble(p3);
			}
			
			
			
			
			List<Formula> list=formulaService.selectAll();
			boolean bl=false;
			for (Formula formula : list) {
				if(fname.equals(formula.getFname())) {
					messageBean.setSuccess(false);
					messageBean.setMsg("该公式已存在!");
					bl=true;
					break;
				}
			}
			if(!bl) {
				Formula formula=new Formula();
				formula.setExpression(expression);
				formula.setFname(fname);
				formula.setP1(P1);
				formula.setP2(P2);
				formula.setP3(P3);
				
				int  fid=formulaService.insertSelective(formula);
				boolean bool=false;
				
			
				if(fid>0) {
					Formula formula2=formulaService.selectByFname(fname);
					
					String[] Xvalues1=Xvalues.split(",");
					String[] Yvalues1=Yvalues.split(",");
					String[] floors1=floors.split(",");
					String[] toplimits1=toplimits.split(",");
					for(int i=0;i<Xvalues1.length;i++) {
						Xparam xparam=new Xparam();
						xparam.setFid(formula2.getFid());
						xparam.setValue(Double.parseDouble(Xvalues1[i]));
						bool=xparamService.insertSelective(xparam);
					}
					
					for(int i=0;i<Yvalues1.length;i++) {
						System.out.println("----"+floors1[i]+"---"+toplimits1[i]);
						Yparam yparam=new Yparam();
						yparam.setFid(formula2.getFid());
						yparam.setFloor(Integer.parseInt(floors1[i]));
						yparam.setToplimit(Integer.parseInt(toplimits1[i]));
						yparam.setValue(Double.parseDouble(Yvalues1[i]));
						bool=yparamService.insertSelective(yparam);
					
					}
					
					
					
					
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
		
		
		//删除指定公式
		@RequestMapping("/delete")
		@ResponseBody
		public MessageBean delete(String fid) {
			
			MessageBean messageBean=new MessageBean("");
			int fid1=Integer.parseInt(fid);
			boolean bool=formulaService.deleteByPrimaryKey(fid1);
			messageBean.setSuccess(bool);
			return messageBean;
			
		}
		
		
		
		//修改指定公式数据
			@RequestMapping("/update")
			@ResponseBody
			public MessageBean update(String fid,String expression,String fname,String p1,String p2,String p3,String oldfname) {
				MessageBean messageBean=new MessageBean("");
				
				double P1=0;
				double P2=0;
				double P3=0;
				int fid1=Integer.parseInt(fid);
				if(p1!=null&&!p1.equals("")) {
					P1=Double.parseDouble(p1);
				}
				if(p2!=null&&!p2.equals("")) {
					P2=Double.parseDouble(p2);
				}
				if(p3!=null&&!p3.equals("")) {
					P3=Double.parseDouble(p3);
				}
				
				List<Formula> list=formulaService.selectAll();
				boolean bl=false;
				for (Formula formula : list) {
					if(fname.equals(formula.getFname())) {
						messageBean.setSuccess(false);
						messageBean.setMsg("该公式已存在!");
						bl=true;
						break;
					}
				}
				if(fname.equals(oldfname)) {
					bl=false;
				}
				if(!bl) {
						Formula formula=new Formula();
						formula.setFid(fid1);
						formula.setExpression(expression);
						formula.setFname(fname);
						formula.setP1(P1);
						formula.setP2(P2);
						formula.setP3(P3);
						
						boolean bool=formulaService.updateByPrimaryKey(formula);
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

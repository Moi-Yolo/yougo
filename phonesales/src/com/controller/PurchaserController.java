package com.controller;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Cart;
import com.entity.Purchaser;
import com.entity.Controllers;
import com.service.CartService;
import com.service.PurchaserService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   PurchaserController {
	private static final int rows = 10;
	@Autowired
	private PurchaserService purchaserService;
	@Autowired
	private CartService cartService;
	
	/**
 * 添加信息
 * @param request
 * @return
 */
	@RequestMapping("/purchaserReg")
	public String purchaserReg(Purchaser purchaser, HttpServletRequest request)
	{
		Purchaser purchaser1=purchaserService.selectBypurnumber(purchaser);
		if(purchaser1!=null)
		{
			request.setAttribute("msg", "用户名已经存在已经存在，不能重复注册!");
			return "purchaser/purchaserReg";
		}
		else
		{
		   purchaserService.add(purchaser);
		   request.setAttribute("msg", "用户注册成功!");
		   return "purchaser/purchaserlogin";
		}
 	}
	/**
	 * 获取列表信息
	 * @param request
	 * @return
	 */
		@RequestMapping("/purchaserList")
		public String purchaserList(HttpServletRequest request) {
			request.setAttribute("flag", 2);
			int page=1;
			if(request.getParameter("page")==null)
			{
				page=1;
			}
			else
			{
			page=Integer.parseInt(request.getParameter("page"));
			}
			request.setAttribute("page", page);
			request.setAttribute("purchaserList", purchaserService.getList(page, rows));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,purchaserService.getTotal(), page, rows)); 
			return "/admin/purchaserManage";
	 	}
		@RequestMapping("/purchaserDelete")
		public String purchaserDelete(int id, HttpServletRequest request) {
			purchaserService.delete(id);
				return "redirect:purchaserList";
	 	}
		@RequestMapping("/purchaserLogin")
		public String purchaserLogin(Purchaser purchaser, HttpServletRequest request, HttpSession session) {
			     String purnumber =request.getParameter("purnumber");//登录账号
			     
			     String purpassword =request.getParameter("purpassword");//登录密码
			     //执行用户登录信息的验证
			     Purchaser purchaser1=purchaserService.purchaserlogin(purnumber, purpassword);
				 if (purchaser1!=null) 
				 {
					request.setAttribute("msg", "登录成功!");
					session.setAttribute("purid", purchaser1.getPurid());//存储用户ID
					session.setAttribute("purnumber", purnumber);//存储登录账号
					session.setAttribute("purpassword", purpassword);//存储登录密码
					session.setAttribute("purchaser", purchaser1);
					Cart cart= new Cart();//初始化购物车
					String purid= session.getAttribute("purid").toString();
					cart.setPurid(Integer.parseInt(purid));
					List<Cart> cartList=cartService.getcartList(cart);
					int zongjia=0;
					int shuliang=0;
					for(int i=0;i<cartList.size();i++) 
					{
						shuliang+=1;
						zongjia+=cartList.get(i).getJiage();
					}
					session.setAttribute("shuliang", shuliang);
					return "redirect:commodityindex";//返回到主界面
				}
				 else 
				 {
				    request.setAttribute("msg", "用户名或密码错误!");
				    return "purchaser/purchaserlogin";
				 }
		}
		@RequestMapping("/purchaserlogout")
		public String purchaserlogout(HttpSession session)
		{
			session.removeAttribute("purchaser");
			return "redirect:commodityindex";
		}
		@RequestMapping("/purchaseredit")
		public String purchaseredit(Purchaser purchaser, HttpServletRequest request, HttpSession session)
		{
			purchaserService.edit(purchaser);
			session.setAttribute("purchaser", purchaser);
			request.setAttribute("msg", "个人信息修改成功!");
		    return "purchaser/purchaserupdate";
			
	 	}
		@RequestMapping("/purchaserpassedit")
		public String purchaserpassedit(Purchaser purchaser, HttpServletRequest request, HttpSession session) 
		{
			String purpassword=request.getParameter("purpassword").toString();
			String purpassword1=request.getParameter("purpassword1").toString();
			String purpassword2=request.getParameter("purpassword2").toString();
			String purnumber= session.getAttribute("purnumber").toString();
			String spurpassword= session.getAttribute("purpassword").toString();
			if (purpassword.equals(spurpassword)) 
			{
			   if (!purpassword1.equals(purpassword2)) 
				{
					request.setAttribute("msg", "两次次输入的新密码不一致!");
				}
				else
				{
					purchaser.setPurnumber(purnumber);
					purchaser.setPurpassword(purpassword1);
					purchaserService.purchaserpassedit(purchaser);
					request.setAttribute("msg", "修改密码成功!");
					session.setAttribute("purpassword", purpassword1);
					return "purchaser/passupdate";
				} 
			} 
			else
			{
				request.setAttribute("msg", "原密码错误!");
		    	return "purchaser/passupdate";
			} 
			return "purchaser/passupdate";
		}
}

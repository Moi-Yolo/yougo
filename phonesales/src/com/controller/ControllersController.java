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
import com.entity.Controllers;
import com.service.ControllersService;
import com.service.OrdersService;
import com.util.PageUtil;
import com.util.UploadUtil;
import com.entity.Commodity;
import com.service.CommodityService;
 
@Controller
@RequestMapping("")
public class   ControllersController {
	@Autowired
	private ControllersService controllersService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private CommodityService commodityService;
	/**
	 * 管理员登录
	 * @return
	 */
	@RequestMapping("/Controllerslogins")
	public String Controllerslogins( HttpServletRequest request, HttpSession session) 
	{
		
		return "admin/login";
	}
	@RequestMapping("/Controllerslogin")
	public String Controllerslogin(HttpServletRequest request, HttpSession session) {
		     String username =request.getParameter("username");
		     String pwd =request.getParameter("pwd"); 
		     Controllers Controllers1=controllersService.controllerslogin(username, pwd);
			 if (Controllers1!=null) 
			 {
				request.setAttribute("msg", "登录成功!");
				session.setAttribute("username", username);
				session.setAttribute("pwd", pwd);
				return "admin/index";
			}
			 else 
			 {
			    request.setAttribute("msg", "用户名或密码错误!");
			    return "admin/login";
			 }
	}
	@RequestMapping("/Controllersmain")
	public String Controllersmain( HttpServletRequest request, HttpSession session) 
	{
		int ordercount=ordersService.getTotal(" and orstate='未发货'");
		session.setAttribute("ordercount", ordercount);
		request.setAttribute("commodityList", commodityService.getList("",1, 100));
		return "admin/main";
	}
	/**
	 * 退出
	 * @return
	 */ 
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("username");
		session.removeAttribute("pwd");
		return "admin/login";
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @return
	 */
		@RequestMapping("/Controllersupdate")
		public String Controllersupdate(Controllers controllers, HttpServletRequest request, HttpSession session) 
		{
			String pwd1=request.getParameter("pwd1").toString();
			String pwd2=request.getParameter("pwd2").toString();
			String pwd3=request.getParameter("pwd3").toString();
			String username= session.getAttribute("username").toString();
			String spwd= session.getAttribute("pwd").toString();
			if (pwd1.equals(spwd)) 
			{
			   if (!pwd2.equals(pwd3)) 
				{
					request.setAttribute("msg", "两次次输入的新密码不一致!");
				}
				else
				{
					controllers.setCtnumber(username);
					controllers.setCtpassword(pwd3);
					controllersService.Controllersupdate(controllers);
					request.setAttribute("msg", "修改密码成功!");
					return "/admin/passupdate";
				} 
			} 
			else
			{
				request.setAttribute("msg", "原密码错误!");
		    	return "/admin/passupdate";
			} 
			return "/admin/passupdate";
		}
}
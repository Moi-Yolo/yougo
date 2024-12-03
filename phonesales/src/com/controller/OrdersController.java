package com.controller;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.entity.Cart;
import com.entity.Orders;
import com.entity.Purchaser;
import com.service.CartService;
import com.service.OrdersService;
import com.service.PurchaserService;
import com.service.CommodityService;
import com.util.PageUtil;
import com.util.UploadUtil;
import com.util.SendMailUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.entity.Commodity;
@Controller
@RequestMapping("")
public class   OrdersController {
	private static final int rows = 10;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private PurchaserService purchaserService;
	
	

	/**
 * 添加信息
 * @param request
 * @return
 */
	@RequestMapping("/ordertijiao")
	public String ordertijiao(HttpServletRequest request,HttpSession session)
	{
		String ornumber=new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		String ortime=new SimpleDateFormat("yyyy-MM-dd hh:mm").format(new Date());
		String purname= request.getParameter("purname");
		String purtel= request.getParameter("purtel");
		String puraddress= request.getParameter("puraddress");
		String ornotes= request.getParameter("ornotes");
		int purid= Integer.parseInt(session.getAttribute("purid").toString());
		String orstate = "未发货";	
		//插入订单明细
		Cart cart= new Cart();
		cart.setPurid(purid);
		List<Cart> cartList=cartService.getcartList(cart);
		int zongjia=0;
		for(int i=0;i<cartList.size();i++) 
		{
			zongjia+=cartList.get(i).getJiage();
			Orders orders = new Orders();
			orders.setOrnumber(ornumber);
			orders.setOrtime(ortime);
			orders.setOrstate(orstate);
			orders.setPurname(purname);
			orders.setPurtel(purtel);
			orders.setPurid(purid);
			orders.setPuraddress(puraddress);
			orders.setOrnotes(ornotes);
			orders.setCommquantity(cartList.get(i).getCommquantity());
			orders.setModid(cartList.get(i).getModid());
			orders.setCommprice(cartList.get(i).getModprice());
			ordersService.add(orders);
	
		}
		//清空购物车
		cartService.cartclear(purid);
		session.setAttribute("shuliang", 0);
		request.setAttribute("msg", "订单提交成功!");
		request.setAttribute("ornumber", ornumber);
		return "/purchaser/cartList2";		
 	}
	@RequestMapping("/myorderList")
	public String myorderList(HttpServletRequest request,HttpSession session)
	{
		//获取用户ID
		String purid= session.getAttribute("purid").toString();
		String where=" and purid="+purid+"";//建立查询条件
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
		//查询我的订单数据集合
		request.setAttribute("orderList", ordersService.getList(where,page, rows));
		//查询我的订单数据集合的总行数
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ordersService.getTotal(where), page, rows)); 
		return "/purchaser/myorders";
 	}
	@RequestMapping("/myorderQuery")
	public String myorderQuery(HttpServletRequest request,HttpSession session)
	{
		String orstate =request.getParameter("orstate");
		String ornumber =request.getParameter("ornumber");
		String purid= session.getAttribute("purid").toString();
		String where=" and purid="+purid+"";
		 if(!orstate.equals("所有"))
		 {
			 where+=" and orstate='"+orstate+"'";
		 }
		 if(!ornumber.equals(""))
		 {
			 where+=" and ornumber='"+ornumber+"'";
		 }
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
		request.setAttribute("orderList", ordersService.getList(where,page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ordersService.getTotal(where), page, rows)); 
		return "/purchaser/myorders";
 	}
	@RequestMapping("/orderManage")
	public String orderManage(HttpServletRequest request,HttpSession session)
	{
		 String where=" and orstate='未发货'";
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
		request.setAttribute("orderList", ordersService.getList(where,page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ordersService.getTotal(where), page, rows)); 
		return "/admin/orderManage";
 	}
	@RequestMapping("/orderQuery")
	public String orderQuery(HttpServletRequest request,HttpSession session)
	{
		 String where=" and orstate='未发货'";
		 String ornumber =request.getParameter("ornumber");
		 if(!ornumber.equals(""))
		 {
			 where+=" and ornumber='"+ornumber+"'";
		 }
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
		request.setAttribute("orderList", ordersService.getList(where,page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ordersService.getTotal(where), page, rows)); 
		return "/admin/orderManage";
 	}
	@RequestMapping("/updateorstate")
	public String updateorstate(String orid,HttpServletRequest request,HttpSession session)
	{
		List<Orders> getList =ordersService.getList(" and orid="+orid+"", 1, 10);
		String ornumber=getList.get(0).getOrnumber();//获取订单编号
		int purid=getList.get(0).getPurid();//获取客户ID
		Purchaser purchaser=purchaserService.purchaserbyid(purid);
		String puremail=purchaser.getPuremail();//获取客户邮箱
		String orstate = "已发货";;
		Orders orders = new Orders();
		try {
			//发送邮件
			SendMailUtil.sendMail(puremail, "发货通知","你的订单已经发货，订单编号："+ornumber+"");
        } catch (MessagingException e) {
            e.printStackTrace();
        }		
		orders.setOrid(Integer.parseInt(orid));
		orders.setOrstate(orstate);
		ordersService.edit(orders);//更新订单状态
		request.setAttribute("msg", "发货成功");
		return "/admin/orderManage";
 	}
	@RequestMapping("/querenshouhuo")
	public String querenshouhuo(String orid,HttpServletRequest request,HttpSession session)
	{
		String orstate = "已确认收货";;
		Orders orders = new Orders();
		orders.setOrid(Integer.parseInt(orid));
		orders.setOrstate(orstate);
		ordersService.edit(orders);
		request.setAttribute("msg", "确认收货成功");
		return "/purchaser/myorders";
 	}
	@RequestMapping("/assessAdd")
	public String assessAdd(HttpServletRequest request,HttpSession session)
	{
	    String assessflag =request.getParameter("assessflag");
	    String assrecontent =request.getParameter("assrecontent");
		String orid =request.getParameter("orid");
		String assestime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String orstate = "已评价";;
		Orders orders = new Orders();
		orders.setOrid(Integer.parseInt(orid));
		orders.setOrstate(orstate);
		orders.setAssessflag(assessflag);
		orders.setAssrecontent(assrecontent);
		orders.setAssestime(assestime);
		ordersService.edit(orders);
		request.setAttribute("msg", "评价成功");
		return "/purchaser/myorders";
 	}
	
	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request,HttpSession session)
	{
		String where="";
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
		request.setAttribute("orderList", ordersService.getList(where,page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ordersService.getTotal(where), page, rows)); 
		return "/admin/orderList";
 	}
	@RequestMapping("/orderQuery1")
	public String orderQuery1(HttpServletRequest request,HttpSession session)
	{
		 String where="";
		 String orstate =request.getParameter("orstate");
		 String ornumber =request.getParameter("ornumber");
		 String purname =request.getParameter("purname");
		 String purtel =request.getParameter("purtel");
		 if(!orstate.equals("所有"))
		 {
			 where+=" and orstate='"+orstate+"'";
		 }
		 if(!ornumber.equals(""))
		 {
			 where+=" and ornumber='"+ornumber+"'";
		 }
		 if(!purname.equals(""))
		 {
			 where+=" and purname='"+purname+"'";
		 }
		 if(!purtel.equals(""))
		 {
			 where+=" and purtel='"+purtel+"'";
		 }
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
		request.setAttribute("orderList", ordersService.getList(where,page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ordersService.getTotal(where), page, rows)); 
		return "/admin/orderList";
 	}
}

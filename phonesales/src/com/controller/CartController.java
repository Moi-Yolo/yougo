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
import com.service.CartService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   CartController {
	private static final int rows = 10;
	@Autowired
	private CartService cartService;
	/**
 * 添加信息
 * @param request
 * @return
 */
	@RequestMapping("/cardadd")
	public String cardadd(HttpServletRequest request,HttpSession session)
	{
		   Cart cart= new Cart();
		   //获取用户ID
		   String purid= session.getAttribute("purid").toString();
		 //获取商品ID
		   int modid =Integer.parseInt(request.getParameter("modid"));
		  //获取下单数量
		   int commquantity =Integer.parseInt(request.getParameter("commquantity"));
		   cart.setModid(modid);
		   cart.setCommquantity(commquantity);
		   cart.setPurid(Integer.parseInt(purid));
		   //验证购物车中是否存在该商品
		   Cart cart1=cartService.selectcartcomm(cart);
			if(cart1!=null)
			{
				cart.setCommquantity(cart1.getCommquantity()+commquantity);
				cart.setCrid(cart1.getCrid());
				cartService.edit(cart);//更新购物车数据
				request.setAttribute("msg", "加入购物车成功!");
				return "/commodityDetail";
			}
			else
			{
				 cart.setCommquantity(commquantity);
				 cartService.add(cart);//新增购物车数据
				 request.setAttribute("msg", "加入购物车成功!");
				 return "/commodityDetail";
			}
			

 	}
	
	@RequestMapping("/cartList")
	public String cartList(HttpServletRequest request,HttpSession session)
	{
		Cart cart= new Cart();
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
		request.setAttribute("cartList", cartList);
		request.setAttribute("zongjia", zongjia);
		return "/purchaser/cartList";
 	}
	@RequestMapping("/cartDelete")
	public String cartDelete(int id, HttpServletRequest request) {
		cartService.delete(id);
		
			return "redirect:cartList";
 	}
	@RequestMapping("/cartjia")
	public String cartjia(int crid,int commquantity, HttpServletRequest request) 
	{
		   Cart cart= new Cart();
		   cart.setCrid(crid);
		   cart.setCommquantity(commquantity+1);
		   cartService.edit(cart);
		   return "redirect:cartList";
 	}
	@RequestMapping("/cartjian")
	public String cartjian(int crid,int commquantity, HttpServletRequest request) 
	{
		  Cart cart= new Cart();
		   cart.setCrid(crid);
		   cart.setCommquantity(commquantity-1);
		   cartService.edit(cart);
		   return "redirect:cartList";
 	}
	@RequestMapping("/cartnextList")
	public String cartnextList(HttpServletRequest request,HttpSession session)
	{
		Cart cart= new Cart();
		String purid= session.getAttribute("purid").toString();
		cart.setPurid(Integer.parseInt(purid));
		List<Cart> cartList=cartService.getcartList(cart);
		int shuliang=0;
		int zongjia=0;
		for(int i=0;i<cartList.size();i++) 
		{
			shuliang+=1;
			zongjia+=cartList.get(i).getJiage();
		}
		session.setAttribute("shuliang", shuliang);
		request.setAttribute("cartList", cartList);
		request.setAttribute("zongjia", zongjia);
		return "/purchaser/cartList1";
 	}
}

package com.controller;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.entity.Commodity;
import com.entity.Model;
import com.service.ModelService;
import com.service.OrdersService;
import com.service.CategoryService;
import com.service.CommodityService;
import com.service.SortService;
import com.entity.Model;
import com.entity.Category;
import com.entity.Sort;
import com.service.ModelService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   CommodityController {
	private static final int rows = 10;
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private SortService sortService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private ModelService modelService;
	@Autowired
	private CategoryService categoryService;
	/**
 * 添加信息
 * @param request
 * @return
 */
	@RequestMapping("/commodityload")
	public String commodityload(HttpServletRequest request)
	{
		String commid=new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		List<Category> categoryList=categoryService.getList("",1, 100);
		request.setAttribute("categoryList", categoryList);
		List<Sort> sortList=sortService.getList(" and a.cateid="+categoryList.get(0).getCateid()+"",1, 100);
		request.setAttribute("commid", commid);
		request.setAttribute("sortList", sortList);
		return "admin/commodityAdd";

 	}
	@RequestMapping("/commodityAdd")
	public String commodityAdd(Commodity commodity,HttpServletRequest request)
	{
		commodityService.add(commodity);
		request.setAttribute("msg", "商品添加成功!");
		return "admin/commodityAdd";
 	}
	/**
	 * 获取列表信息
	 * @param request
	 * @return
	 */
		@RequestMapping("/commodityList")
		public String commodityList(HttpServletRequest request) {
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
			List<Category> categoryList=categoryService.getList("",1, 100);
			request.setAttribute("categoryList", categoryList);
			List<Sort> sortList=sortService.getList(" and a.cateid="+categoryList.get(0).getCateid()+"",1, 100);
			request.setAttribute("sortList", sortList);
			
			request.setAttribute("commodityList", commodityService.getList(where,page, rows));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getTotal(where), page, rows)); 
			return "/admin/commodityManage";
	 	}
		@RequestMapping("/commoditychaxun")
		public String commoditychaxun(HttpServletRequest request) {
			String where=""; 
			 String sortid =request.getParameter("sortid");
			  where=" and a.sortid="+sortid+"";
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
			List<Category> categoryList=categoryService.getList("",1, 100);
			request.setAttribute("categoryList", categoryList);
			List<Sort> sortList=sortService.getList(" and a.cateid="+categoryList.get(0).getCateid()+"",1, 100);
			request.setAttribute("sortList", sortList);
			request.setAttribute("commodityList", commodityService.getList(where,page, rows));
				request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getTotal(where), page, rows)); 
			return "/admin/commodityManage";
	 	}
		@RequestMapping("/commodityDelete")
		public String commodityDelete(String id, HttpServletRequest request) 
		{
			commodityService.delete(id);
			return "redirect:commodityList";
	 	}
		@RequestMapping("/commoditybyid")
		public String commoditybyid(String id,  HttpServletRequest request)
		{
			Commodity commodity=commodityService.commoditybyid(id);			
			request.setAttribute("commodity", commodity);
			int sortid =commodity.getSortid();			
			List<Sort> sortList=sortService.getList(" and a.sortid="+sortid+"",1, 100);			
			int cateid=sortList.get(0).getCateid();			
			List<Category> categoryList=categoryService.getList("",1, 100);			
			List<Sort> sortList1=sortService.getList(" and a.cateid="+cateid+"",1, 100);
			request.setAttribute("sortList", sortList1);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("cateid", cateid);			
			request.setAttribute("modelList", modelService.getList("and commid='"+id+"'",1, 100));			
			return "/admin/commodityEdit";
	 	}
		@RequestMapping("/commodityedit")
		public String commodityedit(Commodity commodity, HttpServletRequest request)
		{
			commodityService.edit(commodity);
			request.setAttribute("msg", "商品修改成功!");
		    return "/admin/commodityEdit";			
	 	}	
		
		
		
		
		@RequestMapping("/commodityindex")
		public String commodityindex(HttpServletRequest request)
		{
			List<Category> categoryList=categoryService.getList("",1, 100);
			request.getSession().setAttribute("categoryList", categoryList);
		    request.setAttribute("commodityList", commodityService.getList("", 1, 8));
			return "/main";
	 	}
		@RequestMapping("/commodityQuery")
		public String commodityQuery(HttpServletRequest request) {
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
			request.setAttribute("commodityList", commodityService.getList("",page, 12));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getTotal(""), page, 12)); 
			return "/commodityList1";
	 	}
		
		@RequestMapping("/commoditycategory")
		public String commoditycategory(int id,HttpServletRequest request) {
			String where=" and a.sortid in(select sortid from sort where cateid="+id+")";

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
			request.setAttribute("commodityList", commodityService.getList(where,page, 12));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getTotal(where), page, 12)); 
			List<Sort> sortList=sortService.getList(" and a.cateid="+id+"",1, 100);
			request.setAttribute("sortList", sortList);
			request.setAttribute("cateid", id);
			return "/commodityList";
	 	}
		
		@RequestMapping("/commoditysort")
		public String commoditycategory(int id,int cateid,HttpServletRequest request) {
			String where=" and a.sortid="+id+"";

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
			request.setAttribute("commodityList", commodityService.getList(where,page, 12));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getTotal(where), page, 12)); 
			List<Sort> sortList=sortService.getList(" and a.cateid="+cateid+"",1, 100);
			request.setAttribute("sortList", sortList);
			request.setAttribute("cateid", cateid);
			return "/commodityList";
	 	}
		
		
		@RequestMapping("/commodityname")
		public String commname(HttpServletRequest request)
		{
			 String commname =request.getParameter("commname");
			String where=" and commname like '%"+commname+"%'";
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
			request.setAttribute("commodityList", commodityService.getList(where,page, 12));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getTotal(where), page, 12)); 
			return "/commodityList1";
	 	}
		@RequestMapping("/commoditycontent")
		public String commoditycontent(String id,  HttpServletRequest request)
		{
			request.setAttribute("commodity", commodityService.getList(" and a.commid='"+id+"'",1,1).get(0));
			request.setAttribute("modelList", modelService.getList("and commid='"+id+"'",1, 100));
			request.setAttribute("modelxuhao", modelService.getList("and commid='"+id+"'",1, 100).get(0).getModid());
			request.setAttribute("orderList", ordersService.getList(" and a.modid in(select modid from model where commid="+id+") and assessflag is not null",1, 100));
			return "/commodityDetail";
	 	}
		@RequestMapping("/commodityxiaoshou")
		public String commodityxiaoshou(HttpServletRequest request) {
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
			request.setAttribute("commodityList", commodityService.getshuliangList());
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,commodityService.getshuliangTotal(), page, rows)); 
			return "/admin/commodityxiaoshou";
	 	}
}

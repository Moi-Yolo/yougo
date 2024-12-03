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
import com.entity.Sort;
import com.service.SortService;
import com.entity.Category;
import com.service.CategoryService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   SortController {
	private static final int rows = 10;
	@Autowired
	private SortService sortService;
	@Autowired
	private CategoryService categoryService;
	/**
 * 添加信息
 * @param request
 * @return
 */
	@RequestMapping("/sortAddload")
	public String sortAddload(HttpServletRequest request)
	{
		request.setAttribute("categoryList", categoryService.getList("",1, 100));
		return "admin/sortManage";
 	}
	@RequestMapping("/sortAdd")
	public String sortAdd(Sort sort, HttpServletRequest request)
	{
		sortService.add(sort);
		request.setAttribute("msg", "小类添加成功!");
		return "admin/sortManage";
 	}
	/**
	 * 获取列表信息
	 * @param request
	 * @return
	 */
		@RequestMapping("/sortList")
		public String sortList(HttpServletRequest request) {
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
			request.setAttribute("categoryList", categoryService.getList("",1, 100));
			request.setAttribute("sortList", sortService.getList(where,page, rows));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,sortService.getTotal(where), page, rows)); 
			return "/admin/sortManage";
	 	}
		@RequestMapping("/sortDelete")
		public String sortDelete(int id, HttpServletRequest request) 
		{
			sortService.delete(id);
			return "redirect:sortList";
	 	}
}

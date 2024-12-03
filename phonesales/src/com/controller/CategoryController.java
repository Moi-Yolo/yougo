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
import com.entity.Category;
import com.service.CategoryService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   CategoryController {
	private static final int rows = 10;
	@Autowired
	private CategoryService categoryService;
	/**
 * 添加信息
 * @param request
 * @return
 */
	@RequestMapping("/categoryAdd")
	public String categoryAdd(Category category, HttpServletRequest request)
	{
		categoryService.add(category);
		request.setAttribute("msg", "大类添加成功!");
		return "admin/categoryManage";
 	}
	/**
	 * 获取列表信息
	 * @param request
	 * @return
	 */
		@RequestMapping("/categoryList")
		public String categoryList(HttpServletRequest request) {
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
			request.setAttribute("categoryList", categoryService.getList(where,page, rows));
			request.setAttribute("pageHtml", PageUtil.getPageHtml(request,categoryService.getTotal(where), page, rows)); 
			return "/admin/categoryManage";
	 	}
		@RequestMapping("/categoryDelete")
		public String categoryDelete(int id, HttpServletRequest request) 
		{
			categoryService.delete(id);
			return "redirect:categoryList";
	 	}
}

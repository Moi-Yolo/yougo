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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.ibatis.annotations.Param;


import com.util.PageUtil;
import com.util.UploadUtil;
import com.entity.Model;
import com.service.ModelService;
import com.entity.Sort;
import com.service.SortService;
@Controller
@RequestMapping("/modelinfo")
public class   ModelController {
	private static final int rows = 10;
	@Autowired
	private ModelService modelService;
	@Autowired
	private SortService sortService;

	@RequestMapping(value = "/modelManage", method = RequestMethod.POST)
	@ResponseBody
    public List<Model> modelManage(@Param("commid") String commid)
	{
		List<Model> modelList =modelService.getList(" and commid='"+commid+"'", 1, 100);
		return modelList;
	}
	
	@RequestMapping(value = "/modelAdd", method = RequestMethod.POST)
	@ResponseBody
    public String modelAdd(@Param("commid") String commid,@Param("modname") String modname,@Param("modprice") Double modprice)
	{
		Model model= new Model();
		model.setCommid(commid);
		model.setModname(modname);
		model.setModprice(modprice);
		modelService.add(model);
		return "success";
	}
	@RequestMapping(value = "/modelDelete", method = RequestMethod.POST)
	@ResponseBody
    public String modelDelete(@Param("modid") int modid)
	{
		modelService.delete(modid);
		return "success";
	}
	@RequestMapping(value = "/modxuanze", method = RequestMethod.POST)
	@ResponseBody
    public Model modxuanze(@Param("modid") int modid)
	{
		Model model =modelService.modelbyid(modid);
		return model;
	}
	@RequestMapping(value = "/findBycategory", method = RequestMethod.POST)
	@ResponseBody
    public List<Sort> findBycategory(@Param("cateid") String cateid)
	{
		List<Sort> sortList =sortService.getList(" and a.cateid='"+cateid+"'", 1, 100);
		return sortList;
	}
	
	
}

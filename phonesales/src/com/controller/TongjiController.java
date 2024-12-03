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
import com.entity.Commodity;
import com.service.CommodityService;

@Controller
@RequestMapping("/tongji")
public class   TongjiController {
	private static final int rows = 10;
	@Autowired
	private CommodityService commodityService;


	@RequestMapping(value = "/shuliangtongji", method = RequestMethod.POST)
	@ResponseBody
     public List<Commodity> shuliangtongji()
	{
		List<Commodity> commodityList =commodityService.getshuliangList();
		return commodityList;
	}
	

	
	
}

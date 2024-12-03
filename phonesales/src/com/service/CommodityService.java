package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.CommodityDao;
import com.entity.Commodity;
@Service
public class   CommodityService 
{
 	@Autowired
	private CommodityDao commodityDao;

	public boolean add(Commodity commodity)
	{
		return commodityDao.insert(commodity) > 0;
	}
	public boolean edit(Commodity commodity)
	{
		return commodityDao.updateByPrimaryKeySelective(commodity) > 0;
	}
	public List<Commodity> getList(String where,int page, int size) 
	{
		return commodityDao.getList(where,size*(page-1), size);
	}
	public boolean delete(String id) 
	{
		return commodityDao.deleteByPrimaryKey(id) > 0;
	}
	public int getTotal(String where)
	{
 		return commodityDao.getTotal(where);
	}
	public Commodity commoditybyid(String id) 
	{
		return commodityDao.selectByPrimaryKey(id);
	}
	public int getshuliangTotal()
	{
 		return commodityDao.getshuliangTotal();
	}
	public List<Commodity> getshuliangList() 
	{
		return commodityDao.getshuliangList();
	}
}

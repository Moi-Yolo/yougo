package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.OrdersDao;
import com.entity.Orders;
import com.entity.Cart;
@Service
public class   OrdersService {
 	@Autowired
	private OrdersDao OrdersDao;
 	
	public boolean add(Orders orders) 
	{
	   return OrdersDao.insert(orders) > 0;
	}
	public List<Orders> getList(String where,int page, int size) 
	{
		return OrdersDao.getList(where,size*(page-1), size);
	}
	public int getTotal(String where)
	{
 		return OrdersDao.getTotal(where);
	}
	
	public List<Orders> getList1(String where,int page, int size) 
	{
		return OrdersDao.getList1(where,size*(page-1), size);
	}
	public int getTotal1(String where)
	{
 		return OrdersDao.getTotal1(where);
	}
	public boolean edit(Orders orders) 
	{
	   return OrdersDao.updateByPrimaryKeySelective(orders) > 0;
	}
}

package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.SortDao;
import com.entity.Sort;
@Service
public class   SortService {
 	@Autowired
	private SortDao sortDao;

	public boolean add(Sort sort)
	{
		return sortDao.insert(sort) > 0;
	}
	public boolean edit(Sort sort)
	{
		return sortDao.updateByPrimaryKeySelective(sort) > 0;
	}
	public List<Sort> getList(String where,int page, int size) 
	{
		return sortDao.getList(where,size*(page-1), size);
	}
	public boolean delete(int id) 
	{
		return sortDao.deleteByPrimaryKey(id) > 0;
	}
	public int getTotal(String where)
	{
 		return sortDao.getTotal(where);
	}
}

package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.CategoryDao;
import com.entity.Category;
@Service
public class   CategoryService {
 	@Autowired
	private CategoryDao categoryDao;

	public boolean add(Category category)
	{
		return categoryDao.insert(category) > 0;
	}
	public boolean edit(Category category)
	{
		return categoryDao.updateByPrimaryKeySelective(category) > 0;
	}
	public List<Category> getList(String where,int page, int size) 
	{
		return categoryDao.getList(where,size*(page-1), size);
	}
	public boolean delete(int id) 
	{
		return categoryDao.deleteByPrimaryKey(id) > 0;
	}
	public int getTotal(String where)
	{
 		return categoryDao.getTotal(where);
	}
}

package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.ModelDao;
import com.entity.Commodity;
import com.entity.Model;
@Service
public class   ModelService {
 	@Autowired
	private ModelDao modelDao;

	public boolean add(Model model)
	{
		return modelDao.insert(model) > 0;
	}
	public boolean edit(Model model)
	{
		return modelDao.updateByPrimaryKeySelective(model) > 0;
	}
	public List<Model> getList(String where,int page, int size) 
	{
		return modelDao.getList(where,size*(page-1), size);
	}
	public boolean delete(int id) 
	{
		return modelDao.deleteByPrimaryKey(id) > 0;
	}
	public int getTotal(String where)
	{
 		return modelDao.getTotal(where);
	}
	public Model modelbyid(int id) 
	{
		return modelDao.selectByPrimaryKey(id);
	}
}

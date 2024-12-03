package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.PurchaserDao;
import com.entity.Commodity;
import com.entity.Purchaser;
@Service
public class   PurchaserService {
 	@Autowired
	private PurchaserDao purchaserDao;

	public boolean add(Purchaser purchaser) 
	{
		return purchaserDao.insert(purchaser) > 0;
	}
	public List<Purchaser> getList(int page, int size) 
	{
		return purchaserDao.getList(size*(page-1), size);
	}
	public List<Purchaser> getAllList() 
	{
		return purchaserDao.getAllList();
	}
	public boolean delete(int id) {
		return purchaserDao.deleteByPrimaryKey(id) > 0;
	}
	public boolean edit(Purchaser purchaser)
	{
		return purchaserDao.updateByPrimaryKeySelective(purchaser) > 0;
	}
	public int getTotal()
	{
 		return purchaserDao.getTotal();
	}
	public Purchaser selectBypurnumber(Purchaser purchaser) 
	{
		Purchaser purchaser1=purchaserDao.selectBypurnumber(purchaser);
		return purchaser1;
	}
	public Purchaser purchaserlogin(String purnumber,String purpassword) 
	{
		return purchaserDao.purchaserlogin(purnumber,purpassword);
	}
	public boolean purchaserpassedit(Purchaser purchaser) 
	{
		return purchaserDao.purchaserpassedit(purchaser) > 0;
	}
	public Purchaser purchaserbyid(int id) 
	{
		return purchaserDao.selectByPrimaryKey(id);
	}
}

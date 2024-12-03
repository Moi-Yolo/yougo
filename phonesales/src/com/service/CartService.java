package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.CartDao;
import com.entity.Cart;
@Service
public class   CartService {
 	@Autowired
	private CartDao cartDao;

	public boolean add(Cart cart) 
	{
	   return cartDao.insert(cart) > 0;
	}
	public Cart selectcartcomm(Cart cart) {
		Cart cart1=cartDao.selectcartcomm(cart);
		return cart1;
	}
	public boolean edit(Cart cart)
	{
		return cartDao.updateByPrimaryKeySelective(cart) > 0;
	}
	public List<Cart> getcartList(Cart cart) {
		 return cartDao.getcartList(cart);
	}
	public boolean delete(int id) {
		return cartDao.deleteByPrimaryKey(id) > 0;
	}
	public boolean cartclear(int id) {
		return cartDao.cartclear(id) > 0;
	}
}

package com.dao;

import com.entity.Cart;
import java.util.List;
public interface CartDao {
    int deleteByPrimaryKey(Integer crid);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer crid);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    Cart selectcartcomm(Cart record);
    List<Cart> getcartList(Cart record);
    int cartclear(Integer csid);
}
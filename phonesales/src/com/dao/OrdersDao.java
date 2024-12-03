package com.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Orders;

public interface OrdersDao {
    int deleteByPrimaryKey(Integer orid);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer orid);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
    
    List<Orders> getList(@Param("where")String where,@Param("begin")int begin, @Param("size")int size);
 	int getTotal(@Param("where")String where);
 	
 	 List<Orders> getList1(@Param("where")String where,@Param("begin")int begin, @Param("size")int size);
  	int getTotal1(@Param("where")String where);
}
package com.dao;

import com.entity.Purchaser;

import java.util.List;
import org.apache.ibatis.annotations.Param;
public interface PurchaserDao {
    int deleteByPrimaryKey(Integer csid);

    int insert(Purchaser record);

    int insertSelective(Purchaser record);

    Purchaser selectByPrimaryKey(Integer csid);

    int updateByPrimaryKeySelective(Purchaser record);

    int updateByPrimaryKey(Purchaser record);
    
    Purchaser purchaserlogin(@Param("purnumber")String csnumber, @Param("purpassword")String cspassword);
    Purchaser selectBypurnumber(Purchaser record);
    List<Purchaser> getList(@Param("begin")int begin, @Param("size")int size);
    List<Purchaser> getAllList();
	int getTotal();
    int purchaserpassedit(Purchaser record);
    
    
}
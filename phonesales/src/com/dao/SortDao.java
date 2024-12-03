package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.entity.Sort;

public interface SortDao {
    int deleteByPrimaryKey(Integer typeid);

    int insert(Sort record);

    int insertSelective(Sort record);

    Sort selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(Sort record);

    int updateByPrimaryKey(Sort record);
    
    List<Sort> getList(@Param("where")String where,@Param("begin")int begin, @Param("size")int size);
	int getTotal(@Param("where")String where);
}
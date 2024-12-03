package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Category;
import com.entity.Sort;

public interface CategoryDao {
    int deleteByPrimaryKey(Integer cateid);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer cateid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    List<Category> getList(@Param("where")String where,@Param("begin")int begin, @Param("size")int size);
	
    int getTotal(@Param("where")String where);
}
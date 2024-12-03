package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Model;
import com.entity.Sort;

public interface ModelDao {
    int deleteByPrimaryKey(Integer modid);

    int insert(Model record);

    int insertSelective(Model record);

    Model selectByPrimaryKey(Integer modid);

    int updateByPrimaryKeySelective(Model record);

    int updateByPrimaryKey(Model record);
    
    List<Model> getList(@Param("where")String where,@Param("begin")int begin, @Param("size")int size);
	int getTotal(@Param("where")String where);
}
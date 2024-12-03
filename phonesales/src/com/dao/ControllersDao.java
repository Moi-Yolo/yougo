package com.dao;

import com.entity.Controllers;
import org.apache.ibatis.annotations.Param;
public interface ControllersDao {
    int deleteByPrimaryKey(Integer ctid);

    int insert(Controllers record);

    int insertSelective(Controllers record);

    Controllers selectByPrimaryKey(Integer ctid);

    int updateByPrimaryKeySelective(Controllers record);

    int updateByPrimaryKey(Controllers record);
    
    Controllers controllerslogin(@Param("ctnumber")String ctnumber, @Param("ctpassword")String ctpassword);
   
    int Controllersupdate(Controllers record);
}
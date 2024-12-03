package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.entity.Commodity;

public interface CommodityDao {
    int deleteByPrimaryKey(String commid);

    int insert(Commodity record);

    int insertSelective(Commodity record);

    Commodity selectByPrimaryKey(String commid);

    int updateByPrimaryKeySelective(Commodity record);

    int updateByPrimaryKeyWithBLOBs(Commodity record);

    int updateByPrimaryKey(Commodity record);
    List<Commodity> getList(@Param("where")String where,@Param("begin")int begin, @Param("size")int size);
	int getTotal(@Param("where")String where);
	int getshuliangTotal();
    List<Commodity> getshuliangList();
}
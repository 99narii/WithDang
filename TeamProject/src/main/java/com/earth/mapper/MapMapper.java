package com.earth.mapper;

import com.earth.model.MapVo;
import org.apache.ibatis.annotations.Insert;

public interface MapMapper {
    @Insert("insert into mappin1 (name,latitude,longitude,pinType) values(#{name},#{latitude},#{longitude},#{type})")
    public void insertPin(MapVo mapVo);

}

package com.earth.mapper;

import com.earth.model.MapVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
    public void insertPin(MapVo mapVo);

}

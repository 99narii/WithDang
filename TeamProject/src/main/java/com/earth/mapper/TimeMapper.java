package com.earth.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface TimeMapper {
	@Select("SELECT NOW()")
	public String getTime1();
	
	public String getTime2();
}

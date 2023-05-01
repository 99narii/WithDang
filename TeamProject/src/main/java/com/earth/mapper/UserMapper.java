package com.earth.mapper;

import com.earth.model.UserVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	public void userJoin(UserVo member);
	
	// 이메일 중복 검사
	public int emailCheck(String user_email);
	
	/* 로그인 */
    public UserVo userLogin(UserVo member);

}

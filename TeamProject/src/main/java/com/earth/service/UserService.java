package com.earth.service;

import com.earth.model.UserVo;

public interface UserService {

	public void userJoin(UserVo member) throws Exception;
	
	// 이메일 중복 검사
	public int emailCheck(String user_email) throws Exception;
	
	/* 로그인 */
    public UserVo userLogin(UserVo member) throws Exception;
}

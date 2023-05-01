package com.earth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.earth.mapper.UserMapper;
import com.earth.model.UserVo;

@Service
public class UserServicelmpl implements UserService {
	
	@Autowired
	UserMapper usermapper;
	
	@Override
	public void userJoin(UserVo member) throws Exception {
		usermapper.userJoin(member);
	}

	@Override
	public int emailCheck(String user_email) throws Exception {
		return usermapper.emailCheck(user_email);
	}

	@Override
	public UserVo userLogin(UserVo member) throws Exception {
		return usermapper.userLogin(member);
	}

	

	

	

	
	
	

}

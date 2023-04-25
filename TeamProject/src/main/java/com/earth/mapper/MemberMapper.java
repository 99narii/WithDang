package com.earth.mapper;

import com.earth.model.MemberVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface MemberMapper {

	public void memberJoin(MemberVo member);
	
	// 이메일 중복 검사
	public int emailCheck(String user_email);
	
	/* 로그인 */
    public MemberVo memberLogin(MemberVo member);

}

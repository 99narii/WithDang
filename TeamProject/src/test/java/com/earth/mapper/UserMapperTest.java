package com.earth.mapper;

import com.earth.model.MapVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.earth.model.UserVo;

import java.util.HashMap;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {

	@Autowired
	private UserMapper membermapper;
	@Autowired
	private MapMapper mapper;

	@Test
	public void mappiin(){
		String pin = "ground";
		MapVo mapVo = new MapVo("수진동 탄천 반려견 놀이공간",37.4369100968,	127.1196602121,pin);


		mapper.insertPin(mapVo);
//		List<MapVo> list = mapper.selectPin(pin);
//		System.out.println(list.get(0).getLatitude());

	}



	/*
	 * @Test public void memberJoin() throws Exception { MemberVo member = new
	 * MemberVo();
	 * 
	 * 
	 * member.setUser_email("spring_test111"); member.setUser_pw("1111111");
	 * member.setUser_name("Test111");
	 * 
	 * 
	 * membermapper.memberJoin(member); }
	 */

	// 아이디 중복검사
//		@Test
//		public void emailCheck() throws Exception{
//			String email = "csj53055@naver.com";	// 존재하는 아이디
//			String email2 = "test123@asdfw.com";	// 존재하지 않는 아이디
//			membermapper.emailCheck(email);
//			membermapper.emailCheck(email2);
//		}

	/* 로그인 쿼리 mapper 메서드 테스트 */
//    @Test
    public void memberLogin() throws Exception{
        
        UserVo member = new UserVo();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
       member.setUser_email("s@s");
       member.setUser_pw("shdldpfm12!");
        
         //올바른 않은 아이디 비번 입력경우
        //member.setUser_email("test1123");
        //member.setUser_pw("test1321321");
        
        membermapper.userLogin(member);
        System.out.println("결과 값 : " + membermapper.userLogin(member));
    }


//	@Test
//	public void mapTest() {
//		String pin = "ground";
////		MapVo coor = new MapVo(37.4939535,127.0172588,"asd");
//
//
//		List<MapVo> list = mapper.selectPin("'"+pin+"'");
////string엔 0~48
//		double distance;
//		double radius=6371; //지구 반지름
//		double toRadian=Math.PI/180;
////		double clat = coor.getLatitude();
////		double clng = coor.getLongitude();
//		for (int i = 0; i <list.size() ; i++) {
//			double locationlat = list.get(i).getLatitude(); //db의 좌표
//			double locationlng = list.get(i).getLongitude(); //db좌표
//			double deltaLatitude = Math.abs(clat - locationlat) * toRadian;
//			double deltaLongitude = Math.abs(clng - locationlng) * toRadian;
//
//			double sinDeltaLat = Math.sin(deltaLatitude / 2);
//			double sinDeltaLng = Math.sin(deltaLongitude / 2);
//			double squareRoot = Math.sqrt(
//					sinDeltaLat * sinDeltaLng + Math.cos(clat * toRadian) * Math.cos(locationlat * toRadian) * sinDeltaLng * sinDeltaLng
//			);
//			distance = 2 * radius * Math.asin(squareRoot);
//			System.out.println(list.get(i).toString() +"          "+ distance);
//		}
//	}


}

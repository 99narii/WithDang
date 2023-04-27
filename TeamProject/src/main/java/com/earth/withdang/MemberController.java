package com.earth.withdang;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.earth.model.MemberVo;
import com.earth.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@RequestMapping(value = {"/main","/"} , method = RequestMethod.GET)
	public String mainPageGET() {

		return "main";

	}

//	@RequestMapping(value="join" ,method = RequestMethod.GET)
//	public void joinGET() {
//		logger.info("회원가입 페이지 진입");
//	}

	@PostMapping("/join")
	public String joinPOST(MemberVo member) throws Exception {
		//회원가입 서비스 실행
		memberservice.memberJoin(member);

		return "redirect:/login";

	}

	//회원가입 완료 페이지
//	@GetMapping("/joinHello")
//	public void joinHelloGET() {
//
//	}

	@GetMapping(value="/login")
	public String loginGET() {

		return "login";
	}

	// 아이디 중복 검사
		@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
		@ResponseBody
		public String memberEmailCheckPOST(String user_email) throws Exception{

			int result = memberservice.emailCheck(user_email);

			if(result != 0) {

				return "fail";	// 중복 아이디가 존재

			} else {

				return "success";	// 중복 아이디 x

			}


		} // memberIdChkPOST() 종료

		/* 로그인 */
	    @RequestMapping(value="/login", method = RequestMethod.POST)
	    public String loginPOST(HttpServletRequest request, MemberVo member, RedirectAttributes rttr) throws Exception{

	    	System.out.println("login 메서드 진입");
	        System.out.println("전달된 데이터 : " + member);
	    	HttpSession session = request.getSession();
	    	MemberVo lvo = memberservice.memberLogin(member);

	    	if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우

	            int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/login";

	        }

	        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)

	        return "redirect:/";

//	      return null;
	    }

	    @GetMapping("/logout")
	    public String logout(HttpSession session) {
	    	session.invalidate();
	    	return "redirect:/";
	    }


}

package com.earth.withdang;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.earth.domain.ComuDTO;
import com.earth.domain.ImageDto;
import com.earth.domain.MemberDto;
import com.earth.domain.PageResolver;
import com.earth.domain.SearchItem;
import com.earth.mapper.ComuMapper;
import com.earth.mapper.ImageMapper;
import com.earth.service.ComuService;
import com.earth.service.ImageService;
import com.earth.upload.S3UploadService;

@Controller
@RequestMapping("/dangcomu")
public class ComuController {

	@Autowired
	ComuService comuService;

	@Autowired
	ComuMapper comuMapper;

	@Autowired
	private S3UploadService s3UploadService;

	@Autowired
	ImageMapper imageMapper;

	@GetMapping("/list")
	public String list(Integer post_ctgr_id, SearchItem sc, Model m, HttpServletRequest request) {

		if (!loginCheck(request)) {
			m.addAttribute("isLoggedIn", false);
		} else {
			m.addAttribute("isLoggedIn", true);
		}

		try {
			List<ComuDTO> list;
			int totalCnt;

			if (post_ctgr_id == null) {
				totalCnt = comuService.getSearchResultCnt(sc);
				m.addAttribute("totalCnt", totalCnt);
				list = comuService.getSearchSelectPage(sc);
			} else {
				totalCnt = comuService.getCategoryResultCnt(post_ctgr_id, sc);
				m.addAttribute("totalCnt", totalCnt);
				list = comuService.getSearchCategoryPage(post_ctgr_id, sc);
				System.out.println("option = " + sc.getOption());
			}

			PageResolver pageResolver = new PageResolver(totalCnt, sc);

			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);

			// 추가적인 모델 속성 및 처리

		} catch (Exception e) {
			e.printStackTrace();
			// 예외 처리
		}

		return "dangcomu";
	}

	@GetMapping("/read")
	public String read(Integer post_id, SearchItem sc, Model m, HttpSession session) {

		try {

			ComuDTO comuDTO = comuService.readPost(post_id);
			String user_email = comuDTO.getUser_email();

			ImageDto dto = new ImageDto(null, "comuPost", user_email, post_id);
			List<ImageDto> images = imageMapper.comuSelectAll(dto);
			m.addAttribute("comuDTO", comuDTO);
			m.addAttribute("images", images);

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/dangcomu/list";
		}

		return "view";
	}

	@GetMapping("/post")
	public String post(Model m, HttpServletRequest request) {

		if (!loginCheck(request)) {
			return "redirect:/login";
		}

		return "write";

	}

	@PostMapping("/post")
	public String post(ComuDTO comuDTO, Model m, HttpSession session, MultipartHttpServletRequest request) {

		List<String> addressList = new ArrayList<String>();

		try {

			MemberDto memberDto = (MemberDto) session.getAttribute("member");
			String user_email = memberDto.getUser_email();
			String user_name = comuMapper.selectUserName(user_email);
			comuDTO.setUser_email(user_email);
			comuDTO.setUser_name(user_name);

			int post_id = comuService.post(comuDTO);

			Iterator<String> fileNames = request.getFileNames();
			while (fileNames.hasNext()) {
				String paramName = fileNames.next();
				MultipartFile file = request.getFile(paramName);
				int sequence = Integer.parseInt(paramName.replace("imgbox", "")) - 1;

				List<String> upload = s3UploadService.upload("comuPost", Collections.singletonList(file));
				ImageDto imageDto = new ImageDto(upload.get(0), "comuPost", user_email, post_id);
				imageMapper.insert(imageDto);
			}

			return "redirect:/dangcomu/list";

		} catch (Exception e) {
			e.printStackTrace();
			return "write";
		}
	}

	@PostMapping("/delete")
	public String delete(Integer post_id, Integer page, Integer pageSize, RedirectAttributes ra, HttpSession session) {

		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		String user_email = memberDto.getUser_email();	

		try {
			
			comuService.deletePost(post_id, user_email);
			ImageDto imageDto = new ImageDto(null, "comuPost", user_email, post_id);
			List<ImageDto> images = imageMapper.comuSelectAll(imageDto);
			
			for (ImageDto image : images) {
				imageMapper.comuDelete(image);						// db에서 삭제
				s3UploadService.deleteFile(image.getPt_adres());    // 이미지 서버에서 삭제
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		ra.addAttribute("page", page);
		ra.addAttribute("pageSize", pageSize);

		return "redirect:/dangcomu/list";

	}

	@GetMapping("/update")
	public String update(Integer post_id, Model m, HttpSession session, HttpServletRequest reques) {

		ComuDTO comuDTO;
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		String user_email = memberDto.getUser_email();

		ImageDto dto = new ImageDto(null, "comuPost", user_email, post_id);
		List<ImageDto> photoList = imageMapper.comuSelectAll(dto);

		try {

			comuDTO = comuService.readPost(post_id);
			m.addAttribute("comuDTO", comuDTO);
			m.addAttribute("photoList", photoList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "edit";

	}

	@PostMapping("/update")
	public String update(ComuDTO comuDTO, Integer page, Integer pageSize, Integer post_id, Model m, HttpSession session,
			MultipartHttpServletRequest multipartRequest, RedirectAttributes ra) {

		Enumeration<String> parameterNames = multipartRequest.getParameterNames();
		List<String> addressList = new ArrayList<String>();
		MemberDto member = (MemberDto) session.getAttribute("member");

		try {

			String user_email = member.getUser_email();
			String user_name = comuMapper.selectUserName(user_email);
			comuDTO.setUser_email(user_email);
			comuDTO.setUser_name(user_name);

			while(parameterNames.hasMoreElements()) { 
				 String paramName = parameterNames.nextElement();
			  
				 if(paramName.startsWith("imgbox")) { 
					 String paramValue = multipartRequest.getParameter(paramName);
					 int sequence = Integer.parseInt(paramName.replace("imgbox", "")) - 1;
					 addressList.add(paramValue); 
				 }
			}
			 
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while (fileNames.hasNext()) {
				String paramName = fileNames.next();
				MultipartFile file = multipartRequest.getFile(paramName);
				int sequence = Integer.parseInt(paramName.replace("imgbox", "")) - 1;

				List<String> upload = s3UploadService.upload("comuPost", Collections.singletonList(file));
				addressList.add(upload.get(0));
			}

			ImageDto dto = new ImageDto(null, "comuPost", user_email, post_id);
			List<ImageDto> photoList = imageMapper.comuSelectAll(dto);

			for (ImageDto photo : photoList) {
				if (addressList.contains(photo.getPt_adres())) {
					imageMapper.comuDelete(photo);
				} else {
					imageMapper.comuDelete(photo);
					s3UploadService.deleteFile(photo.getPt_adres());
				}
			}
			
			for (String address : addressList) {
				dto.setPt_adres(address);
				imageMapper.insert(dto);
			}
			
			
			if (comuService.updatePost(comuDTO) != 1)
				throw new Exception("Update Fail");

			ra.addAttribute("page", page);
			ra.addAttribute("pageSize", pageSize);

			return "redirect:/dangcomu/list";

		} catch (Exception e) {
			e.printStackTrace();

			m.addAttribute("comuDTO", comuDTO);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

			return "edit";
		}

	}

	// 로그인 체크
	public boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		try {
			return session.getAttribute("member") != null;
		} catch (NullPointerException e) {
			return false;
		}
	}
}
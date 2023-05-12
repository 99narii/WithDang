package com.earth.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.earth.model.ComuDTO;
import com.earth.model.PageResolver;
import com.earth.model.SearchItem;
import com.earth.service.ComuService;

@Controller
@RequestMapping("/dangcomu")
public class ComuController {
	
	@Autowired
	ComuService comuService;
	
	@GetMapping("/list")
	public String list(SearchItem sc, Model m, HttpServletRequest request) {
		
		try {
			int totalCnt = comuService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<ComuDTO> list = comuService.getSearchSelectPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);
			
		} catch (Exception e) { e.printStackTrace(); }
		
		return "dangcomu";			// 로그인 한 상태, 게시물 화면 목록으로 이동
	}
	
	
	@GetMapping("/read")
	public String read(Integer post_id, SearchItem sc, Model m) {
		
		try {
			ComuDTO comuDTO = comuService.readPost(post_id);
			m.addAttribute("comuDTO", comuDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/dangcomu/list";
		}
		
		return "view";
	}
	
	@GetMapping("/post")
	public String post(Model m) {
		m.addAttribute("mode", "new");
		return "write";
	}
	
	@PostMapping("/post")
	public String post(ComuDTO comuDTO, RedirectAttributes ra, Model m, HttpSession session) {
		
//		String user_id = (String) session.getAttribute("user");
//		comuDTO.setUser_id(user_id);
		
		try {
			if (comuService.post(comuDTO) != 1)
				throw new Exception("Post Fail");
			ra.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/dangcomu/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("comuDTO", comuDTO);
			ra.addFlashAttribute("msg", "WRT_ERR");
			return "write";
		}
			
	}
	
	@PostMapping("/delete")
	public String delete(Integer post_id, Integer page, Integer pageSize, 
			RedirectAttributes ra, HttpSession session) {
		
		String user_email = (String) session.getAttribute("user");
		ra.addFlashAttribute("msg", "DEL_OK");
		
		try {
			if(comuService.deletePost(post_id, user_email) != 1) 
				throw new Exception("Delete Fail");
				
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("msg", "DEL_ERR");
		}
		
		ra.addAttribute("page", page);
		ra.addAttribute("pageSize", pageSize);
		
		return "redirect:/dangcomu/list";
		
	}
	
	@GetMapping("/update")
	public String update(Integer post_id, Model m, HttpSession session) {
		
		ComuDTO comuDTO;
		
		try {
			comuDTO = comuService.readPost(post_id);
			m.addAttribute("comuDTO", comuDTO); 
			System.out.println(comuDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "edit";
		
	}
	
	@PostMapping("/update")
	public String update(ComuDTO comuDTO, Integer page, Integer pageSize, 
			RedirectAttributes ra, Model m, HttpSession session) {
		
//		String user_id = (String) session.getAttribute("user");
//		comuDTO.setUser_id(user_id); 
		
		try {
			if(comuService.updatePost(comuDTO) != 1) 
				throw new Exception("Delete Fail");
			ra.addAttribute("page", page); 
			ra.addAttribute("pageSize", pageSize);
			ra.addFlashAttribute("msg", "UPDATE_OK");
			return "redirect:/dangcomu/list";
		} catch (Exception e) { 
			e.printStackTrace(); 
			m.addAttribute("comuDTO", comuDTO); 
			m.addAttribute("page", page); 
			m.addAttribute("pageSize", pageSize); 
			m.addAttribute("msg", "UPDATE_ERR"); 
			return "edit"; 
		}
		
	}
}
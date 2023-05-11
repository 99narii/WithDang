package com.earth.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.earth.model.CommentDTO;
import com.earth.model.ComuDTO;
import com.earth.model.SearchItem;

public interface ComuService {

	int post(ComuDTO comuDTO) throws Exception;
	int deletePost(Integer post_id, String user_id) throws Exception;
	int updatePost(ComuDTO comuDTO) throws Exception;
	ComuDTO readPost(Integer post_id) throws Exception;
	int getSearchResultCnt(SearchItem sc)  throws Exception;
	List<ComuDTO> getSearchSelectPage(SearchItem sc)  throws Exception;
	int comment(CommentDTO commentDTO) throws Exception;
	int deleteComment(Integer cmt_id, String user_id) throws Exception;
	
}
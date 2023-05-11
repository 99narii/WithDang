package com.earth.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.earth.model.CommentDTO;
import com.earth.model.ComuDTO;
import com.earth.model.SearchItem;

@Mapper
public interface ComuMapper {
	
	ComuDTO select(Integer post_id) throws Exception;
	   
	List<ComuDTO> selectAll() throws Exception;
	
	List<ComuDTO> selectPage(Map map) throws Exception;
   
	int searchResultCnt(SearchItem sc) throws Exception;
	
	List<ComuDTO> searchSelectPage(SearchItem sc) throws Exception;
	
	String selectUserName(Integer user_id) throws Exception;
	
	int insert(ComuDTO comuDTO) throws Exception;
   
	int delete(Map map) throws Exception;
	
	int deleteForAdmin(Integer post_id) throws Exception;

	int deleteAll() throws Exception;
   
    int count() throws Exception;
   
    int update(ComuDTO comuDTO) throws Exception;
   
    int increaseViewCnt(Integer post_id) throws Exception;
    
    /* 댕댕커뮤 댓글 기능 */
    int comment(CommentDTO commentDTO) throws Exception;
    
    int deleteComment(Map map) throws Exception;
    
    int deleteCommentForAdmin(Integer post_id) throws Exception;
    
}

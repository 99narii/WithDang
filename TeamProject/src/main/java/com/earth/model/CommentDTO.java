package com.earth.model;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	
	private int cmt_id;
	private String cmt_content;
	private Date cmt_created_time;
	private Date cmt_update_time;
	private int post_id;
	private int user_id;
	
}
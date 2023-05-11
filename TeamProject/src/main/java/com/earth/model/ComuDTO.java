package com.earth.model;

import java.util.Date;

import lombok.Data;

@Data
public class ComuDTO {

	private int post_id;
	private String post_title;
	private String post_content;
	private int post_ctgr_id;
	private Date post_update_time;
	private Date post_created_time;
	private int post_view_count;
	private String post_status;
	private int user_id;
	private String user_name;
	
}
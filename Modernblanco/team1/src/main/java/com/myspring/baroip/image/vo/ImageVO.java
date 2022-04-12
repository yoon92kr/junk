// 2021.12.09 À±»óÇö

package com.myspring.baroip.image.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("imageVO")
public class ImageVO {
	private String image_id;
	private String image_match_id;
	private String image_category;
	private String image_file_name;
	private Date image_cre_date;
	private byte[] image_file;
	private String image_file_encode;
	
	
	public String getImage_id() {
		return image_id;
	}
	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}
	public String getImage_match_id() {
		return image_match_id;
	}
	public void setImage_match_id(String image_match_id) {
		this.image_match_id = image_match_id;
	}
	public String getImage_category() {
		return image_category;
	}
	public void setImage_category(String image_category) {
		this.image_category = image_category;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public Date getImage_cre_date() {
		return image_cre_date;
	}
	public void setImage_cre_date(Date image_cre_date) {
		this.image_cre_date = image_cre_date;
	}
	public byte[] getImage_file() {
		return image_file;
	}
	public void setImage_file(byte[] image_file) {
		this.image_file = image_file;
	}
	public String getImage_file_encode() {
		return image_file_encode;
	}
	public void setImage_file_encode(String image_file_encode) {
		this.image_file_encode = image_file_encode;
	}
	

}

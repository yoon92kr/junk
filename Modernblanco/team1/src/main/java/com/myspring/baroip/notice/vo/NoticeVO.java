// 2021.12.24 ¿”ºÆ»Ò

package com.myspring.baroip.notice.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private String notice_id;
	private String user_id;
	private String notice_category;
	private String notice_pw;
	private String notice_title;
	private String notice_body;
	private Date notice_cre_date;
	private int notice_grade;
	private String notice_private;
	private String notice_type;
	private String order_id;
	private String product_id;
	private String notice_match_no;
	private String notice_parent_no;
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNotice_category() {
		return notice_category;
	}
	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}
	public String getNotice_pw() {
		return notice_pw;
	}
	public void setNotice_pw(String notice_pw) {
		this.notice_pw = notice_pw;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_body() {
		return notice_body;
	}
	public void setNotice_body(String notice_body) {
		this.notice_body = notice_body;
	}
	public Date getNotice_cre_date() {
		return notice_cre_date;
	}
	public void setNotice_cre_date(Date notice_cre_date) {
		this.notice_cre_date = notice_cre_date;
	}
	public int getNotice_grade() {
		return notice_grade;
	}
	public void setNotice_grade(int notice_grade) {
		this.notice_grade = notice_grade;
	}
	public String getNotice_private() {
		return notice_private;
	}
	public void setNotice_private(String notice_private) {
		this.notice_private = notice_private;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getNotice_match_no() {
		return notice_match_no;
	}
	public void setNotice_match_no(String notice_match_no) {
		this.notice_match_no = notice_match_no;
	}
	public String getNotice_parent_no() {
		return notice_parent_no;
	}
	public void setNotice_parent_no(String notice_parent_no) {
		this.notice_parent_no = notice_parent_no;
	}
	
		
}

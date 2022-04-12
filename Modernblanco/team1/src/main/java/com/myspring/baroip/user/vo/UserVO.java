package com.myspring.baroip.user.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("userVO")
public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_rank;
	private String user_membership;
	private Date user_join_date;
	private Date user_last_date;
	private String user_post_code;
	private String user_old_address;
	private String user_new_address;
	private String user_detail_address;
	private String user_birth_year;
	private String user_birth_month;
	private String user_birth_day;
	private String user_mobile_1;
	private String user_mobile_2;
	private String user_mobile_3;
	private int user_point;
	private String user_email;
	private int user_total_count;
	private int user_total_amount;
	private int user_total_point;

	
	public int getUser_total_point() {
		return user_total_point;
	}

	public void setUser_total_point(int user_total_point) {
		this.user_total_point = user_total_point;
	}

	public int getUser_total_count() {
		return user_total_count;
	}

	public void setUser_total_count(int user_total_count) {
		this.user_total_count = user_total_count;
	}

	public int getUser_total_amount() {
		return user_total_amount;
	}

	public void setUser_total_amount(int user_total_amount) {
		this.user_total_amount = user_total_amount;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_rank() {
		return user_rank;
	}

	public void setUser_rank(String user_rank) {
		this.user_rank = user_rank;
	}

	public String getUser_membership() {
		return user_membership;
	}

	public void setUser_membership(String user_membership) {
		this.user_membership = user_membership;
	}

	public Date getUser_join_date() {
		return user_join_date;
	}

	public void setUser_join_date(Date user_join_date) {
		this.user_join_date = user_join_date;
	}

	public Date getUser_last_date() {
		return user_last_date;
	}

	public void setUser_last_date(Date user_last_date) {
		this.user_last_date = user_last_date;
	}

	public String getUser_post_code() {
		return user_post_code;
	}

	public void setUser_post_code(String user_post_code) {
		this.user_post_code = user_post_code;
	}

	public String getUser_old_address() {
		return user_old_address;
	}

	public void setUser_old_address(String user_old_address) {
		this.user_old_address = user_old_address;
	}

	public String getUser_new_address() {
		return user_new_address;
	}

	public void setUser_new_address(String user_new_address) {
		this.user_new_address = user_new_address;
	}

	public String getUser_detail_address() {
		return user_detail_address;
	}

	public void setUser_detail_address(String user_detail_address) {
		this.user_detail_address = user_detail_address;
	}

	public String getUser_birth_year() {
		return user_birth_year;
	}

	public void setUser_birth_year(String user_birth_year) {
		this.user_birth_year = user_birth_year;
	}

	public String getUser_birth_month() {
		return user_birth_month;
	}

	public void setUser_birth_month(String user_birth_month) {
		this.user_birth_month = user_birth_month;
	}

	public String getUser_birth_day() {
		return user_birth_day;
	}

	public void setUser_birth_day(String user_birth_day) {
		this.user_birth_day = user_birth_day;
	}

	public String getUser_mobile_1() {
		return user_mobile_1;
	}

	public void setUser_mobile_1(String user_mobile_1) {
		this.user_mobile_1 = user_mobile_1;
	}

	public String getUser_mobile_2() {
		return user_mobile_2;
	}

	public void setUser_mobile_2(String user_mobile_2) {
		this.user_mobile_2 = user_mobile_2;
	}

	public String getUser_mobile_3() {
		return user_mobile_3;
	}

	public void setUser_mobile_3(String user_mobile_3) {
		this.user_mobile_3 = user_mobile_3;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

}

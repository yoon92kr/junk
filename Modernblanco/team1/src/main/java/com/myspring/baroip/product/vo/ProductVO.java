// 2021.12.09 À±»óÇö

package com.myspring.baroip.product.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {
	private String product_id;
	private String user_id;
	private Date product_cre_date;
	private String product_main_title;
	private String product_sub_title;
	private String product_body;
	private int product_price;
	private int product_discount;
	private int product_amount;
	private String product_main_category;
	private String product_sub_category;
	private String product_states;
	private String product_count;
	
	
	public String getProduct_count() {
		return product_count;
	}
	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getProduct_cre_date() {
		return product_cre_date;
	}
	public void setProduct_cre_date(Date product_cre_date) {
		this.product_cre_date = product_cre_date;
	}
	public String getProduct_main_title() {
		return product_main_title;
	}
	public void setProduct_main_title(String product_main_title) {
		this.product_main_title = product_main_title;
	}
	public String getProduct_sub_title() {
		return product_sub_title;
	}
	public void setProduct_sub_title(String product_sub_title) {
		this.product_sub_title = product_sub_title;
	}
	public String getProduct_body() {
		return product_body;
	}
	public void setProduct_body(String product_body) {
		this.product_body = product_body;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	public String getProduct_main_category() {
		return product_main_category;
	}
	public void setProduct_main_category(String product_main_category) {
		this.product_main_category = product_main_category;
	}
	public String getProduct_sub_category() {
		return product_sub_category;
	}
	public void setProduct_sub_category(String product_sub_category) {
		this.product_sub_category = product_sub_category;
	}
	public String getProduct_states() {
		return product_states;
	}
	public void setProduct_states(String product_states) {
		this.product_states = product_states;
	}
	
	
}

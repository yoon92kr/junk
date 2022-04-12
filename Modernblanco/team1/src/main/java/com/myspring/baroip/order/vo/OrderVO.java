// 2022.01.14 À±»óÇö

package com.myspring.baroip.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {

	private String order_id;
	private String user_id;
	private String product_id;
	private int order_amount;
	private String order_receiver_name;
	private String order_receiver_mobile_1;
	private String order_receiver_mobile_2;
	private String order_receiver_mobile_3;
	private String order_receiver_post_code;
	private String order_receiver_old_address;
	private String order_receiver_new_address;
	private String order_receiver_detail_address;
	private Date order_date;
	private String order_state;	
	private String order_payment;
	private Date order_payment_detail;
	private String order_payment_card;
	private String order_message;
	private int order_payment_point;
	private String order_delivery_id;
	
	
	public String getOrder_delivery_id() {
		return order_delivery_id;
	}
	public void setOrder_delivery_id(String order_delivery_id) {
		this.order_delivery_id = order_delivery_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_receiver_name() {
		return order_receiver_name;
	}
	public void setOrder_receiver_name(String order_receiver_name) {
		this.order_receiver_name = order_receiver_name;
	}
	public String getOrder_receiver_mobile_1() {
		return order_receiver_mobile_1;
	}
	public void setOrder_receiver_mobile_1(String order_receiver_mobile_1) {
		this.order_receiver_mobile_1 = order_receiver_mobile_1;
	}
	public String getOrder_receiver_mobile_2() {
		return order_receiver_mobile_2;
	}
	public void setOrder_receiver_mobile_2(String order_receiver_mobile_2) {
		this.order_receiver_mobile_2 = order_receiver_mobile_2;
	}
	public String getOrder_receiver_mobile_3() {
		return order_receiver_mobile_3;
	}
	public void setOrder_receiver_mobile_3(String order_receiver_mobile_3) {
		this.order_receiver_mobile_3 = order_receiver_mobile_3;
	}
	public String getOrder_receiver_post_code() {
		return order_receiver_post_code;
	}
	public void setOrder_receiver_post_code(String order_receiver_post_code) {
		this.order_receiver_post_code = order_receiver_post_code;
	}
	public String getOrder_receiver_old_address() {
		return order_receiver_old_address;
	}
	public void setOrder_receiver_old_address(String order_receiver_old_address) {
		this.order_receiver_old_address = order_receiver_old_address;
	}
	public String getOrder_receiver_new_address() {
		return order_receiver_new_address;
	}
	public void setOrder_receiver_new_address(String order_receiver_new_address) {
		this.order_receiver_new_address = order_receiver_new_address;
	}
	public String getOrder_receiver_detail_address() {
		return order_receiver_detail_address;
	}
	public void setOrder_receiver_detail_address(String order_receiver_detail_address) {
		this.order_receiver_detail_address = order_receiver_detail_address;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public Date getOrder_payment_detail() {
		return order_payment_detail;
	}
	public void setOrder_payment_detail(Date order_payment_detail) {
		this.order_payment_detail = order_payment_detail;
	}
	public String getOrder_payment_card() {
		return order_payment_card;
	}
	public void setOrder_payment_card(String order_payment_card) {
		this.order_payment_card = order_payment_card;
	}
	public String getOrder_message() {
		return order_message;
	}
	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}
	public int getOrder_payment_point() {
		return order_payment_point;
	}
	public void setOrder_payment_point(int order_payment_point) {
		this.order_payment_point = order_payment_point;
	}
	
	

	
	
}

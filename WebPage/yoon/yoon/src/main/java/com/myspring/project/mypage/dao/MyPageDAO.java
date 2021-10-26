package com.myspring.project.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.project.member.vo.MemberVO;
import com.myspring.project.order.vo.OrderVO;

public interface MyPageDAO {
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException;
	public List selectMyOrderInfo(String order_id) throws DataAccessException;
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException;
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public void updateMyOrderCancel(String order_id) throws DataAccessException;
}

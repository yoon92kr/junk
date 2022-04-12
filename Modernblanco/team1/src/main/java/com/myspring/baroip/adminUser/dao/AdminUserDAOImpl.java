// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.user.vo.UserVO;

@Repository("adminUserDAO")
public class AdminUserDAOImpl implements AdminUserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// option에 따른 회원 목록 조회 DAO
	@Override
	public List<UserVO> userList (Map<String, String> option) throws DataAccessException {
		
		List<UserVO> allUserList = sqlSession.selectList("mapper.adminUser.userList", option);
						
		return allUserList;
	}
	
	// 상품 등록 DAO, 반환값 == 등록된 product_id
	@Override
	public String updateRank (Map<String, String> option) throws DataAccessException {
		
		String message = "";
		String user_id = option.get("user_id");
		String user_rank = option.get("user_rank");
		
		if(user_rank.equals("0")) {
			user_rank = "비회원";
		}
		else if(user_rank.equals("1")) {
			user_rank = "회원";
		}
		else if(user_rank.equals("2")) {
			user_rank = "일반 관리자";
		}
		else if(user_rank.equals("3")) {
			user_rank = "상품 관리자";
		}
		else if(user_rank.equals("4")) {
			user_rank = "총 책임자";
		}
				
			boolean flag = sqlSession.selectOne("mapper.adminUser.searchRank4", option);
			
			if(flag) {
				sqlSession.update("mapper.adminUser.updateRank", option);
				System.out.printf("baroip : [%s]님의 회원 권한이 [%s]로 변경되었습니다.%n", user_id, user_rank);
				message = "["+user_id+"]님의 회원 권한이 ["+user_rank+"]로 변경되었습니다.";
			}
			
			// flag가 false일경우는, 총 책임자가 1명이며 변경하고자 하는 user_id가 총책임자일 경우이다.
			else if(!flag) {
				message = "총 책임자는 1명 이상 존재해야 합니다.";
			}

		
	
						
		return message;
	}
	
	// 회원 삭제 DAO
	@Override
	public String deleteUser(Map<String, String> info) throws DataAccessException {
		String message = "";
		String user_id = info.get("user_id");
		
		boolean flag = sqlSession.selectOne("mapper.adminUser.searchRank4", info);
		
		if(flag) {
			sqlSession.delete("mapper.adminUser.deleteUser", info);
			System.out.printf("baroip : [%s]님의 계정이 정상적으로 삭제되었습니다.%n", user_id);
			message = "["+user_id+"]님의 계정이 정상적으로 삭제되었습니다.";
		}
		// flag가 false일경우는, 총 책임자가 1명이며 삭제하고자 하는 user_id가 총책임자일 경우이다.
		else if(!flag) {
			message = "총 책임자는 1명 이상 존재해야 합니다.";
		}
		
		return message;
	}
	
	// 회원 수정 DAO
	@Override
	public int updateUser(UserVO userVO) throws DataAccessException {

		int flag = sqlSession.update("mapper.adminUser.updateUser", userVO);
		
		return flag;
	}
	
	// 회원 수정을 위한 정보 조회 DAO
	@Override
	public UserVO selectOneUser(String user_id) throws DataAccessException {
		UserVO user_info = sqlSession.selectOne("mapper.adminUser.selectOneUser", user_id);
		
		return user_info;
	}
	
	
	
}

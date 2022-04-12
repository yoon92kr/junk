// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.user.vo.UserVO;

public interface AdminUserDAO {
	
	// option에 따른 회원 목록 조회 DAO
	public List<UserVO> userList (Map<String, String> option) throws DataAccessException;
	
	// 회원 권한 수정 DAO
	public String updateRank (Map<String, String> option) throws DataAccessException;
	
	// 회원 삭제 DAO
	public String deleteUser(Map<String, String> info) throws DataAccessException;
	
	// 회원 수정 DAO
	public int updateUser(UserVO userVO) throws DataAccessException;
	
	// 회원 한명 조회 DAO
	public UserVO selectOneUser(String user_id) throws DataAccessException;
	

}

// 2021.12.28 ������

package com.mat.modernblanco.adminUser.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.user.vo.UserVO;

public interface AdminUserDAO {
	
	// option�� ���� ȸ�� ��� ��ȸ DAO
	public List<UserVO> userList (Map<String, String> option) throws DataAccessException;
	
	// ȸ�� ���� ���� DAO
	public String updateRank (Map<String, String> option) throws DataAccessException;
	
	// ȸ�� ���� DAO
	public String deleteUser(Map<String, String> info) throws DataAccessException;
	
	// ȸ�� ���� DAO
	public int updateUser(UserVO userVO) throws DataAccessException;
	
	// ȸ�� �Ѹ� ��ȸ DAO
	public UserVO selectOneUser(String user_id) throws DataAccessException;
	

}

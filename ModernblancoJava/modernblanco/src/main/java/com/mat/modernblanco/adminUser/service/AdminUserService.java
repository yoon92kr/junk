// 2021.12.28 ������

package com.mat.modernblanco.adminUser.service;

import java.util.List;
import java.util.Map;

import com.mat.modernblanco.user.vo.UserVO;

public interface AdminUserService {

	// ȸ�� ��ü ����Ʈ ��ȸ
	public List<UserVO> userList (Map<String, String> option) throws Exception;
	
	// ȸ�� ���� ���� ����
	public String updateRank(Map<String, String> option) throws Exception;
	
	// ȸ�� ���� ����
	public String deleteUser(Map<String, String> info) throws Exception;
		
	// ȸ�� ���� ����
	public int updateUser(UserVO userVO) throws Exception;
	
	// ȸ�� ������ ���� ���� ��ȸ DAO	
	public UserVO selectOneUser(String user_id) throws Exception;
}

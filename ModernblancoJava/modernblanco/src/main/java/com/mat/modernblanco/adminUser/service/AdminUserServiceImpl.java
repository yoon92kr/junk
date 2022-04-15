// 2021.12.28 ������

package com.mat.modernblanco.adminUser.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mat.modernblanco.adminUser.dao.AdminUserDAO;
import com.mat.modernblanco.user.vo.UserVO;

@Service("adminUserService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminUserServiceImpl implements AdminUserService{
	
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	// ȸ�� ��ü ����Ʈ ��ȸ	
	@Override
	public List<UserVO> userList (Map<String, String> option) throws Exception {
		
		if(option.get("search_option").equals("joinDate") || option.get("search_option").equals("lastAccess")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);
 
		}
		else if (option.get("search_option").equals("rank")) {
			
			String target = option.get("search_value");
			
			if (target.equals("guest")) {
				option.put("search_value", "0");
			}
			else if (target.equals("user")) {
				option.put("search_value", "1");	
			}			
			else if (target.equals("admin")) {
				option.put("search_value", "2");
			}
			
			
			}

		List<UserVO> allUserList = adminUserDAO.userList(option);
		
		return allUserList;
		
	}
	
	// ȸ�� ���� ���� ����
	@Override
	public String updateRank(Map<String, String> option) throws Exception {
		
		String message = adminUserDAO.updateRank(option);
		
		return message;
	}
	
	// ȸ�� ���� ����
	@Override
	public String deleteUser(Map<String, String> info) throws Exception {
		
		String message = adminUserDAO.deleteUser(info);
		
		return message;
		
	}
	
	// ȸ�� ���� ����
	@Override
	public int updateUser(UserVO userVO) throws Exception {
		
		int flag = adminUserDAO.updateUser(userVO);
		
		return flag;
	}
	
	// ȸ�� ������ ���� ���� ��ȸ DAO
	@Override
	public UserVO selectOneUser(String user_id) throws Exception {
		UserVO user_info = adminUserDAO.selectOneUser(user_id);
		
		return user_info;
	}
}

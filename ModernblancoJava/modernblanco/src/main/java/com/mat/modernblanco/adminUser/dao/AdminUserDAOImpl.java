// 2021.12.28 ������

package com.mat.modernblanco.adminUser.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.user.vo.UserVO;

@Repository("adminUserDAO")
public class AdminUserDAOImpl implements AdminUserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// option�� ���� ȸ�� ��� ��ȸ DAO
	@Override
	public List<UserVO> userList (Map<String, String> option) throws DataAccessException {
		
		List<UserVO> allUserList = sqlSession.selectList("mapper.adminUser.userList", option);
						
		return allUserList;
	}
	
	// ��ǰ ��� DAO, ��ȯ�� == ��ϵ� product_id
	@Override
	public String updateRank (Map<String, String> option) throws DataAccessException {
		
		String message = "";
		String user_id = option.get("user_id");
		String user_rank = option.get("user_rank");
		
		if(user_rank.equals("0")) {
			user_rank = "��ȸ��";
		}
		else if(user_rank.equals("1")) {
			user_rank = "ȸ��";
		}
		else if(user_rank.equals("2")) {
			user_rank = "�Ϲ� ������";
		}
		else if(user_rank.equals("3")) {
			user_rank = "��ǰ ������";
		}
		else if(user_rank.equals("4")) {
			user_rank = "�� å����";
		}
				
			boolean flag = sqlSession.selectOne("mapper.adminUser.searchRank4", option);
			
			if(flag) {
				sqlSession.update("mapper.adminUser.updateRank", option);
				System.out.printf("baroip : [%s]���� ȸ�� ������ [%s]�� ����Ǿ����ϴ�.%n", user_id, user_rank);
				message = "["+user_id+"]���� ȸ�� ������ ["+user_rank+"]�� ����Ǿ����ϴ�.";
			}
			
			// flag�� false�ϰ���, �� å���ڰ� 1���̸� �����ϰ��� �ϴ� user_id�� ��å������ ����̴�.
			else if(!flag) {
				message = "�� å���ڴ� 1�� �̻� �����ؾ� �մϴ�.";
			}

		
	
						
		return message;
	}
	
	// ȸ�� ���� DAO
	@Override
	public String deleteUser(Map<String, String> info) throws DataAccessException {
		String message = "";
		String user_id = info.get("user_id");
		
		boolean flag = sqlSession.selectOne("mapper.adminUser.searchRank4", info);
		
		if(flag) {
			sqlSession.delete("mapper.adminUser.deleteUser", info);
			System.out.printf("baroip : [%s]���� ������ ���������� �����Ǿ����ϴ�.%n", user_id);
			message = "["+user_id+"]���� ������ ���������� �����Ǿ����ϴ�.";
		}
		// flag�� false�ϰ���, �� å���ڰ� 1���̸� �����ϰ��� �ϴ� user_id�� ��å������ ����̴�.
		else if(!flag) {
			message = "�� å���ڴ� 1�� �̻� �����ؾ� �մϴ�.";
		}
		
		return message;
	}
	
	// ȸ�� ���� DAO
	@Override
	public int updateUser(UserVO userVO) throws DataAccessException {

		int flag = sqlSession.update("mapper.adminUser.updateUser", userVO);
		
		return flag;
	}
	
	// ȸ�� ������ ���� ���� ��ȸ DAO
	@Override
	public UserVO selectOneUser(String user_id) throws DataAccessException {
		UserVO user_info = sqlSession.selectOne("mapper.adminUser.selectOneUser", user_id);
		
		return user_info;
	}
	
	
	
}

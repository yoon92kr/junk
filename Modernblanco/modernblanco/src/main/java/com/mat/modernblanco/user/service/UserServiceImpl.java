package com.mat.modernblanco.user.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mat.modernblanco.user.dao.UserDAO;
import com.mat.modernblanco.user.vo.UserVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Service("userService")
@Transactional(propagation=Propagation.REQUIRED)
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO login(Map loginMap) throws Exception {
		return userDAO.login(loginMap);
	}
	
	@Override
	public String addUser(UserVO userVO) throws Exception {
		/* userDAO.insertNewUser(userVO); */
		return userDAO.insertNewUser(userVO);
	}
	
	@Override
	public String userIdOverlap(String id) throws Exception{
		return userDAO.selectIdOverlap(id);
	}
	
//	��ȸ�� �ֹ��� ���̵� ���� �� ���̵� ��ȸ
	@Override
	public String guestJoin() throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUser_name("��ȸ��");
		return userDAO.insertGuestId(userVO);
	}
	
//	naver�α��� �� ���̵� ����
	@Override
	public void naverLogin(UserVO userVO) throws Exception {
		userDAO.addNaverUser(userVO);
	}
	
//	�ڵ��� ����
	@Override
	public void userPhoneCheck(String mobile, int randomNumber) {
		String api_key = "NCSD82BYMIRY1ADB";
		String api_secret = "TDY85PNGZVY1MNPES0C9VQKVPCKPA92E";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", mobile);
		params.put("from", "01086739295");
		params.put("type", "SMS");
		params.put("text", "�ٷ��� ������ȣ�� " + "[" + randomNumber + "]" + " �Դϴ�.");
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	
//	���̵� ã��
	@Override
	public String userIdFind(UserVO userVO) throws Exception {
		return userDAO.userIdFind(userVO);
	}
	
//	��й�ȣ ã�� �� ȸ�� ���� ��ġ Ȯ��
	@Override
	public UserVO inputUserCheck(UserVO userVO) throws Exception {
		return userDAO.inputUserCheck(userVO);
	}
	
//	��й�ȣ ã�� �� ��й�ȣ ����
	@Override
	public void updateUserPwd(UserVO userVO) throws Exception {
		userDAO.updateFindUserPwd(userVO);
		
	}
	
	//	������ ������ ������Ʈ Service
	@Override
	public void updateLastDate(String user_id) throws Exception {
		userDAO.updateLastDate(user_id);
		
	}
}

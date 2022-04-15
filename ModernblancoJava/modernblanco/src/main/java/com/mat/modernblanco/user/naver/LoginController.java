package com.mat.modernblanco.user.naver;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mat.modernblanco.user.service.UserService;
import com.mat.modernblanco.user.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller("naverController")
@RequestMapping(value="/user/naver")
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private UserService userService;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

//���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/naverCallBack.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody ModelAndView naverCallBack(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. �α��� ����� ������ �о�´�.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String������ json������
		/**
		 * apiResult json ���� {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2. String������ apiResult�� json���·� �ٲ�
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
	//3. ������ �Ľ�
	//Top���� �ܰ� _response �Ľ�
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String email = (String) response_obj.get("email");
		String mobileNumber = (String) response_obj.get("mobile");
		String userName = (String) response_obj.get("name");
		String mobile[] = mobileNumber.split("-");
		String mobile_1 = mobile[0];
		String mobile_2 = mobile[1];
		String mobile_3 = mobile[2];
		
		UserVO userVO = new UserVO();
		userVO.setUser_id(email);
		userVO.setUser_email(email);
		userVO.setUser_name(userName);
		userVO.setUser_mobile_1(mobile_1);
		userVO.setUser_mobile_2(mobile_2);
		userVO.setUser_mobile_3(mobile_3);
		
		String naverUser = userService.userIdOverlap(email);
		
		if(naverUser.equals("true") != true) {
			userService.naverLogin(userVO);
		}
		
		userVO.setUser_rank("1");
		session.setAttribute("loginOn", true);
		// ȸ������ ���� set
		session.setAttribute("userInfo",userVO);
		
		mav.addObject("result", apiResult);
		mav.setViewName("redirect:/main.do");
		return mav;
	}
}

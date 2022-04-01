package com.myspring.restful;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	@ResponseBody
	@RequestMapping(value = "/hashing.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String home(HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> param) {
		
		
		System.out.printf("IP : %s �� Ŭ���̾�Ʈ�� ��û�� ���½��ϴ�. %n", request.getRemoteAddr());

		HashingTool tool = new HashingTool();
		
		String result = "";
		String userID = "TestID";

		String password = (String) param.get("pw");
		byte[] byteParam = password.getBytes();
		String salt = "mordern" + userID + "balanco";

		HttpSession session = request.getSession();
		
		System.out.println(session);
		
		try {
			result = tool.setParam(byteParam, salt);

		} catch (Exception e) {
			System.out.println(e);
		}
		
		// DB������ �ش� USER�� PW�� ���������� Ȯ���Ѵ�.
		String target = "481e7746ae29dda46bc2abab03b5066b50d7bfde725959a993fd4b3abbebdf09";

		if(result.equals(target)) {
			result = "��ġ";
		}
		else {
			result = "����ġ";
		}
		
		return result;
	}

}

package com.myspring.restful;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TrackingController {
	
	@Autowired
	TrackingService trackingService;


	
	// 회원일 경우, DB에 저장된 배송정보(배송업체 / 운송장번호)를 확인한뒤 배송조회를 진행한다.
	// 비회원의 경우, 입력된 송장번호를 기준으로 배송정보를 확인한 뒤, 배송조회를 진행한다.
	
	@ResponseBody
	@RequestMapping(value = "/search.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String, Object> craw_select(@RequestParam Map<String, Object> inform) throws Exception {
		
		
		Map<String, Object> testmap = trackingService.findDelivery(inform);
		
		return testmap;
	}
	

}

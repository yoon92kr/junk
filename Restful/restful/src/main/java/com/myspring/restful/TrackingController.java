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


// 비회원의 경우 송장번호를 기재하면 length에 따른 택배사 분기
	// 회원의 경우, 주문상품의 배송정보를 db에서 추출
	
	@ResponseBody
	@RequestMapping(value = "/search.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String, Object> craw_select(@RequestParam Map<String, Object> inform) throws Exception {
		
		
		Map<String, Object> testmap = trackingService.findDelivery(inform);
		
		return testmap;
	}
	

}

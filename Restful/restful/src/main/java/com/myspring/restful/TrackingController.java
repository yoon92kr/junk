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


	
	// ȸ���� ���, DB�� ����� �������(��۾�ü / ������ȣ)�� Ȯ���ѵ� �����ȸ�� �����Ѵ�.
	// ��ȸ���� ���, �Էµ� �����ȣ�� �������� ��������� Ȯ���� ��, �����ȸ�� �����Ѵ�.
	
	@ResponseBody
	@RequestMapping(value = "/search.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String, Object> craw_select(@RequestParam Map<String, Object> inform) throws Exception {
		
		
		Map<String, Object> testmap = trackingService.findDelivery(inform);
		
		return testmap;
	}
	

}

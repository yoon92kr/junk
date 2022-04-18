package com.myspring.restful;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrackingService {
	
	@Autowired
	CommonService commonService;
	
	public Map<String, Object> findDelivery(Map<String, Object> inform) {
		
		String deliveryId = "";
		String url = "https://apis.tracker.delivery/carriers";
				
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(!commonService.nullCheck((String)inform.get("deliveryId"))) {
			deliveryId = (String)inform.get("deliveryId");	
		}		
		
		// Modern blanco�� ��� ���� �ù�簡 3���̸�, �� �ù�� �� ����� ��ȣ�� �����ϱ⶧���� �Ʒ��� ���� ���ǹ��� ����Ѵ�.
		// ����
		if(deliveryId.length() == 11) {
			url = url +  "/kr.logen/tracks/" + deliveryId;
		}
		// CJ�������
		else if(deliveryId.length() == 10) {
			url = url +  "/kr.cjlogistics/tracks/" + deliveryId;
		}
		// ��ü��
		else if(deliveryId.length() == 13) {
			url = url +  "/kr.epost/tracks/" + deliveryId;
		}
		
		// ��ȯ�� ������ �Ľ� �� url�� ȣ��
		// �ܺ� api ������� �����.
		
		result = commonService.callAPI(url);
		
		return result;
		
	}

	
	
	
	// �����ù� �����ȸ 
	private Map<String, Object> logenDelivery(String deliveryId) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		// ���� �����ȸ API ȣ��
		String url = "https://www.ilogen.com/web/personal/trace/" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
			System.out.println(doc);
		}
		
		catch(Exception e) {
			
		}
				
		return result;
		
	}
	
	// CJ������� �����ȸ
	private Map<String, Object> cjDelivery(String deliveryId) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		// CJ������� �����ȸ API ȣ��
		String url = "http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
			System.out.println(doc);
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	
	// ��ü�� �����ȸ
	private Map<String, Object> PostDelivery(String deliveryId){
		
		Map<String, Object> result = new HashMap<String, Object>();
		// ��ü�� �����ȸ API ȣ��
		String url = "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=" + deliveryId;
		
		try {
			Document doc = Jsoup.connect(url).get();	
			System.out.println(doc);
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	

}

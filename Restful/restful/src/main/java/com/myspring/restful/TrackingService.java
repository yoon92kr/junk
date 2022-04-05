package com.myspring.restful;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class TrackingService {
	
	Map<String, Object> result = new HashMap<String, Object>();
	
	public Map<String, Object> findDelivery(Map<String, Object> inform) {
		
		String deliveryId = (String)inform.get("deliveryId");
		
		// ��۾�ü ������ null�� ���
		if(inform.get("company").equals(null) && inform.get("company").equals("") ) {
			
		}
		// ��۾�ü ������ �Էµ� ���
		else {
			
		}
		
		return result;
		
	}

	
	
	
	// �����ù� �����ȸ 
	private Map<String, Object> logenDelivery(String deliveryId) {
		
		
		String url = "https://www.ilogen.com/web/personal/trace/" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
			Elements b = doc.select("b");
			Elements tr = doc.select("tr");
		}
		
		catch(Exception e) {
			
		}
				
		return result;
		
	}
	
	// CJ������� �����ȸ
	private Map<String, Object> cjDelivery(String deliveryId) {
		
		String url = "http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	
	// ��ü�� �����ȸ
	private Map<String, Object> PostDelivery(String deliveryId){
		
		String url = "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=" + deliveryId;
		
		try {
			Document doc = Jsoup.connect(url).get();	
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	

}

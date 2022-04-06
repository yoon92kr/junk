package com.myspring.restful;

import org.springframework.stereotype.Service;

@Service
public class CommonService {
	
	public boolean nullCheck(String param) {
		
		boolean flag = false;
		
		if(param.isBlank()) {
			flag = true;
		}
		if(param.isEmpty()) {
			flag = true;
		}
		
		
		return flag;
	}

}

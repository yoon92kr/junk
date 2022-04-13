// 2021.12.09 ������

package com.mat.modernblanco.adminOrder.service;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	
	// �ɼǿ� ���� �ֹ� ����Ʈ ��ȸ Service
	public List<Map<String, Object>> orderListToOption( Map<String, String> option) throws Exception;
	
	// �ֹ� ���� ���漭��
	public void updateState(Map<String, String> option) throws Exception;
	
	// ��ȸ ���ǿ� ���� ��ǰ ����Ʈ ��ȸ ����
	public List<Map<String, Object>> selectRefundToOption( Map<String, String> option) throws Exception;
	
	// ��ǰ ���� ȣ�� ����
	public Map<String, Object> returnDetail(String order_id) throws Exception ;
	
	// ��ǰ��û ���� ���漭��
	public String updateReturnState(Map<String, String> option) throws Exception;
}

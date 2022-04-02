package com.myspring.restful;

import java.security.MessageDigest;

public class HashingTool {

	public String setParam(byte[] target, String salt) throws Exception {

		String result = hashing(target, salt);

		return result;
	}

	// byte[] ���� hashing ��, String���� ��ȯ���ִ� �޼ҵ�
	// salt���� UserID�� �Է��Ѵ�.
	// target���� hashing �ϰ��� �ϴ� ���ڿ��� �Է��Ѵ�.
	private String hashing(byte[] target, String salt) throws Exception {

		String result = "";

		MessageDigest md = MessageDigest.getInstance("SHA-256");

		for (int i = 0; i < salt.length(); i++) {
			md.update(target);
			target = md.digest();
			result = byteToString(target);
		}

		result += salt;

		md.update(target);
		target = md.digest();
		result = byteToString(target);

		System.out.println(result);

		return result;
	}

	private String byteToString(byte[] target) {

		StringBuilder sb = new StringBuilder();
		for (byte a : target) {
			sb.append(String.format("%02x", a));
		}
		return sb.toString();

	}

}

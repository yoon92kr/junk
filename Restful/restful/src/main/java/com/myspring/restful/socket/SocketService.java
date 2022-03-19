package com.myspring.restful.socket;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketService {
	 // ���� Client class �� �����Ѵ�. Ŭ������ �Ķ���ʹ� ����� ����.

	  // �ش�  Ŭ������ ������ ip�ּҿ� port ��ȣ�� �ְ� ��� ��Ʈ������ �Ѿ�� Server Socket�� �����Ѵ�.

	  // Server Socket class�� client�� ������ �ߴ��� üũ���ϴ� �뵵�̴�.

	  // ������ ���� �νĵǸ� ���� Ŭ������ ������ Socket.accept() �޼ҵ带 �����Ѵ�.


	    public static void main(String[] args) throws IOException {
	         int port = 5050;

	         int number = Integer.parseInt(args[0]); // ����ٷ� ���� �ؽ�Ʈ���� ���������� ��ȯ���� ����
	         String str = new String(args[1]);



	         //���� ������ ����
	         ServerSocket ssk = new ServerSocket(port); 

	         System.out.println("���� �����");

	         while(true) { //������ �۽��� �ϴ°��� �ٷ� �� sock �̶�� �����̴�.
	         Socket sock = ssk.accept(); 
	         System.out.println("����� ���� �߽��ϴ�");
	         System.out.println("Client ip :"+ sock.getInetAddress());

	         //Ŭ���̾�Ʈ�� ������ �ϱ����� ��Ʈ���� �����Ѵ�.
	         OutputStream ous = sock.getOutputStream();
	         DataOutputStream dous = new DataOutputStream(ous); 

	         dous.writeUTF(str);
	         dous.writeInt(number);
	         dous.flush();
	         dous.close();
	         sock.close();


	         } 
	    }

}

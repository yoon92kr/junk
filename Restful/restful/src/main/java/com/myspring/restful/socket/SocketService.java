package com.myspring.restful.socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketService {
	 // ���� Client class �� �����Ѵ�. Ŭ������ �Ķ���ʹ� ����� ����.

	  // �ش�  Ŭ������ ������ ip�ּҿ� port ��ȣ�� �ְ� ��� ��Ʈ������ �Ѿ�� Server Socket�� �����Ѵ�.

	  // Server Socket class�� client�� ������ �ߴ��� üũ���ϴ� �뵵�̴�.

	  // ������ ���� �νĵǸ� ���� Ŭ������ ������ Socket.accept() �޼ҵ带 �����Ѵ�.


	    public static void main(String[] args) throws IOException {
	    	
	    	 Socket socket = null;                //Client�� ����ϱ� ���� Socket
	         ServerSocket server_socket = null;  //���� ������ ���� ServerSocket 
	         BufferedReader in = null;            //Client�κ��� �����͸� �о���̱� ���� �Է½�Ʈ��
	         PrintWriter out = null;                //Client�� �����͸� �������� ���� ��� ��Ʈ��
	         
	         try{
	             server_socket = new ServerSocket(Ư�� ��Ʈ �Է�);
	             
	         }catch(IOException e)
	         {
	             System.out.println("�ش� ��Ʈ�� �����ֽ��ϴ�.");
	         }
	         try {
	             
	             System.out.println("���� ����!!");
	             socket = server_socket.accept();    //���� ���� , Client ���� ���
	             
	             in = new BufferedReader(new InputStreamReader(socket.getInputStream()));    //�Է½�Ʈ�� ����
	             out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()))); //��½�Ʈ�� ����
	             
	             String str = null;
	             str = in.readLine();                //Client�κ��� �����͸� �о��

	             System.out.println("Client�� ���� �� �޼��� : " + str);
	             
	             out.write(str);
	             out.flush();
	             socket.close();
	         }catch(IOException e){}


	         } 
	    }

}

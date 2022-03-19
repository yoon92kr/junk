package com.myspring.restful.socket;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketService {
	 // 먼저 Client class 를 생성한다. 클래스의 파라미터는 보기와 같다.

	  // 해당  클래스에 서버의 ip주소와 port 번호를 넣고 출력 스트림으로 넘어간후 Server Socket에 접근한다.

	  // Server Socket class는 client가 접속을 했는지 체크만하는 용도이다.

	  // 접근이 옴이 인식되면 서버 클래스는 제빨리 Socket.accept() 메소드를 실행한다.


	    public static void main(String[] args) throws IOException {
	         int port = 5050;

	         int number = Integer.parseInt(args[0]); // 명렬줄로 들어온 텍스트값을 정수형으로 변환시켜 저장
	         String str = new String(args[1]);



	         //서버 소켓을 생성
	         ServerSocket ssk = new ServerSocket(port); 

	         System.out.println("접속 대기중");

	         while(true) { //실제로 송신을 하는것은 바로 저 sock 이라는 변수이다.
	         Socket sock = ssk.accept(); 
	         System.out.println("사용자 접속 했습니다");
	         System.out.println("Client ip :"+ sock.getInetAddress());

	         //클라이언트와 연결을 하기위한 스트림을 생성한다.
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

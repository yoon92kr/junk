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
	 // 먼저 Client class 를 생성한다. 클래스의 파라미터는 보기와 같다.

	  // 해당  클래스에 서버의 ip주소와 port 번호를 넣고 출력 스트림으로 넘어간후 Server Socket에 접근한다.

	  // Server Socket class는 client가 접속을 했는지 체크만하는 용도이다.

	  // 접근이 옴이 인식되면 서버 클래스는 제빨리 Socket.accept() 메소드를 실행한다.


	    public static void main(String[] args) throws IOException {
	    	
	    	 Socket socket = null;                //Client와 통신하기 위한 Socket
	         ServerSocket server_socket = null;  //서버 생성을 위한 ServerSocket 
	         BufferedReader in = null;            //Client로부터 데이터를 읽어들이기 위한 입력스트림
	         PrintWriter out = null;                //Client로 데이터를 내보내기 위한 출력 스트림
	         
	         try{
	             server_socket = new ServerSocket(특정 포트 입력);
	             
	         }catch(IOException e)
	         {
	             System.out.println("해당 포트가 열려있습니다.");
	         }
	         try {
	             
	             System.out.println("서버 오픈!!");
	             socket = server_socket.accept();    //서버 생성 , Client 접속 대기
	             
	             in = new BufferedReader(new InputStreamReader(socket.getInputStream()));    //입력스트림 생성
	             out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()))); //출력스트림 생성
	             
	             String str = null;
	             str = in.readLine();                //Client로부터 데이터를 읽어옴

	             System.out.println("Client로 부터 온 메세지 : " + str);
	             
	             out.write(str);
	             out.flush();
	             socket.close();
	         }catch(IOException e){}


	         } 
	    }

}

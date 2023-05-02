package com.day18;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.MulticastSocket;

public class ChatCS extends Frame implements Runnable, ActionListener {

	private static final long serialVersionUID = 1L;

	private MulticastSocket ms = null;//���ο��� ����� ��Ƽ����
	private InetAddress xGroup = null;
	
	private String host = "230.0.0.2";
	private int port = 7777;
	private String userName = "����";
	
	private TextArea ta = new TextArea();
	private TextField tf = new TextField();
	
	//DatagramSocket : UDP�� �����ͱ׷� ��Ŷ�� �����ϰų� ����
	//DatagramPacket : UDP�� �̿��Ͽ� ���۵� �� �ִ� ������
	//MulticastSocket : �ټ��� Ŭ���̾�Ʈ�� �����ͱ׷��� ����@@
	//D class ���� : 224.0.0.0 ~ 239.255.255.255
	
	public ChatCS() {
		
		ta.setEditable(false);
		add(ta, BorderLayout.CENTER);
		
		add(tf, BorderLayout.SOUTH);
		tf.addActionListener(this);
		
		addWindowListener(new WindowAdapter() {
			
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		setTitle("�׷�ä�� [" + host + "]");
		setSize(400, 400);
		setVisible(true);
		tf.requestFocus();
	}
	
	
	
	public void setup() {
		
		try {
			
			xGroup = InetAddress.getByName(host); // ip
			ms = new MulticastSocket(port); // port
			
			//Ư�� �׷쿡 ����
			ms.joinGroup(xGroup);
			
			Thread th = new Thread(this);
			th.start();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	
	public void disConnect() { // ���� ����
		
		try {
			
			ms.leaveGroup(xGroup); // ms���� xGroup�� �����ϰ� ms�� ����
			ms.close();
			
		} catch (Exception e) {
			
		}
	}
	
	public static void main(String[] args) {
		
		new ChatCS().setup();

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		
		String str = tf.getText().trim();
		if(str.equals(""))
			return; 
		
		byte[] buffer = (userName + "]" + str).getBytes();
		
		try {
			
			DatagramPacket dp = new DatagramPacket(buffer, buffer.length, xGroup, port);
			
			ms.send(dp); // ������.
			
			tf.setText("");
			tf.requestFocus();
			
			
		} catch (Exception e2) {
			System.out.println(e2.toString());
		}
	}

	@Override
	public void run() {
		
		//�����带 ���� �ݴ������� ������ ���ڸ� ����
		
		try {
			
			while(true) {
				
				byte[] buffer = new byte[512]; // �ѹ� ���� �� 512�� ��ŭ ����
				
				DatagramPacket dp = new DatagramPacket(buffer, buffer.length);
				
				ms.receive(dp);
				
				String str = new String(dp.getData()).trim();
				
				ta.append(str + "\r\n");
				
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
			disConnect();
		}
		
	}
}
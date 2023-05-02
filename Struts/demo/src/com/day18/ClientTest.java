package com.day18;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

//���� �������̽�
public class ClientTest extends Frame implements ActionListener,Runnable{

	private static final long serialVersionUID = 1L;
	
	private TextArea ta = new TextArea();
	private TextField tf = new TextField();
	
	// Ŭ���̾�Ʈ�� ���ϸ� �ʿ�
	private Socket sc = null;
	private String host = "localhost";//localhost(127.0.0.1)192.168.16.0
	private int port = 7777;
	
	
	// �⺻ �����ڸ� ���� ActionListener�� �⺻���� ����
	public ClientTest() {
		
		add(ta,BorderLayout.CENTER);
		add(tf,BorderLayout.SOUTH);
		
		//�ؽ�Ʈ�Է�â�� ������
		tf.addActionListener(this);
		
		//����
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
				
		setTitle("ä��Ŭ���̾�Ʈ");
		setSize(300, 400);
		setVisible(true);
		
	}	

	public void connect() {
		
		try {
			
			sc = new Socket(host, port); //(������ ip , ��Ʈ)
			
			Thread th = new Thread(this);
			th.start();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}	
	
	// ����Ǹ� main���� ���� ���� ã�ư���.
	public static void main(String[] args) {
		new ClientTest().connect();
	}

	@Override
	public void run() {
		//�����͸� ������ 
		
		String str;
				
		try {
			
			if(sc==null)
				return;
			
			InputStream is = sc.getInputStream();
			BufferedReader br = new BufferedReader(new 
					InputStreamReader(is));
						
			while((str=br.readLine())!=null) {
				ta.append("\r\n" + str);
			}			
			
		} catch (Exception e) {
			ta.append("\r\n ���� ���� ����...");
			sc = null;
		}
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		//�����͸� ������
		
		String str = tf.getText();
		
		if(str.trim().equals("")) {
			return;
		}
		
		if(sc==null) {
			return;
		}
		
		try {
					
			//true:flush
			PrintWriter pw = new PrintWriter(sc.getOutputStream(),true);
			pw.println("����]" + str); //Ŭ���̾�Ʈ�� ����
			
			ta.append("\r\n����]:" + str);
			
			tf.setText("");
			tf.requestFocus();
			
		} catch (Exception e2) {
			ta.append("\r\n ������ ������ ������ϴ�...");
			sc = null;
		}
		
				
	}

}
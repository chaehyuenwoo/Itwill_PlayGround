package com.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConn;

public class MemberServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		//��������ų ������ ������ url
		String url;
		
		
		if(uri.indexOf("created.do")!= -1) {
			
			url = "/member/created.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("created_ok.do")!= -1) {
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.insertData(dto);
			
			url = cp;
			resp.sendRedirect(url);
			
			
		}else if(uri.indexOf("login.do")!= -1) {
			
			url = "/member/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("login_ok.do")!= -1) {
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = dao.getReadData(userId);
			
			if(dto==null || (!dto.getUserPwd().equals(userPwd))) {
				
				req.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���!");
				url = "/member/login.jsp";
				
				forward(req, resp, url);
				
				return;
				
			}
			
			//���������� ���Ǹ���� ���
			HttpSession session = req.getSession();
			
			//customInfo�� ���� ���̴� ��ü ����
			CustomInfo info = new CustomInfo();
			
			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			
			//���ǿ� �α��� ���� ����
			session.setAttribute("customInfo", info);
			
			//���������� ����ȭ������ ����
			url = cp;
			//������ �����Ű�� �����̷�Ʈ �ؾ� �Ѵ�,
			resp.sendRedirect(url);
			
			
			//�α׾ƿ��� ���ǿ� �ִ� �����͸� �����,
		}else if(uri.indexOf("logout.do")!= -1) {
			
			HttpSession session = req.getSession();
			
			session.removeAttribute("customInfo"); //���ǿ� �ִ� ������ ����
			session.invalidate();//���ǿ� �ִ� ������ ����
			
			url = cp;
			resp.sendRedirect(url);
			
			
		}else if(uri.indexOf("searchpw.do")!=-1){
			
			//��й�ȣ ã��
			url = "/member/searchpw.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("searchpw_ok.do")!=-1) {
			
			//���̵�� ��ȭ��ȣ�� ������ ��
			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto = dao.getReadData(userId);//����Ʈ�� �����غ��ϰ� 

			if(dto==null || (!dto.getUserTel().equals(userTel))) {

				req.setAttribute("message", "ȸ�������� ���������ʽ��ϴ�!!");

				url = "/member/login.jsp";
				forward(req, resp, url);
				return;				

			}else {
				
				String userPwd = dto.getUserPwd();
				
				req.setAttribute("message", "��й�ȣ�� " + userPwd + " �Դϴ�");

				url = "/member/login.jsp";
				forward(req, resp, url);
				return;				

			}
			
			/*//���̵�� ��ȭ��ȣ ��
			if(userId.equals(dto.getUserId())  && userTel.equals(dto.getUserTel())) {
			//���̵� ���ų� �н����尡 Ʋ����
			//dto�� ���̰ų� || !dto�� �ִ� userpwd�� ��ġ���� ������ 


				String UserPwd= dto.getUserPwd();
				
				req.setAttribute("message2", "��й�ȣ�� " + UserPwd);

				url = "/member/login.jsp";
				forward(req, resp, url);
				
				return;
				
			} else if(dto==null || (!dto.getUserTel().equals(userTel))) {
				
				req.setAttribute("message3", "ȸ�������� �������� �ʽ��ϴ�");

				url = "/member/login.jsp";
				forward(req, resp, url);
				return;
				
				}*/
				
			} else if(uri.indexOf("updated.do")!=-1){
				
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
				
				MemberDTO dto = dao.getReadData(info.getUserId());
				req.setAttribute("dto", dto);
				//ȸ���������� ������ ������
				url = "/member/updated.jsp";
				forward(req, resp, url);
				
			}else if(uri.indexOf("updated_ok.do")!=-1) {
				
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
				
				
				MemberDTO dto = new MemberDTO();
			
				dto.setUserId(info.getUserId());
				dto.setUserPwd(req.getParameter("userPwd"));
				dto.setUserBirth(req.getParameter("userBirth"));
				dto.setUserTel(req.getParameter("userTel"));
		
				dao.updateData(dto);
			
				url = cp ;
				resp.sendRedirect(url);
				
				
				}
			
			
		}
		
	}
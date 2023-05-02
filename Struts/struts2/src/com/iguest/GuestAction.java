package com.iguest;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.util.MyUtil;
import com.util.dao.CommonDAO;
import com.util.dao.CommonDAOImpl;

//Struts2�� DTO�� �����͸� �ѱ����� Struts2+ajax�� ���� ���� ajax�� �����͸� �ѱ��.
//Struts2�� �����͸� �ѱ� �ʿ䰡 ��������.�׷��� dto�� getter�� �ʿ����.
public class GuestAction extends ActionSupport 
	implements Preparable,ModelDriven<GuestDTO> {

	private static final long serialVersionUID = 1L;
	
	private GuestDTO dto;
	
	
	//�����ʹ� ajax�� �ѱ�⶧���� �̰� �ʿ����
	/*public GuestDTO getDto() {
		return dto;
	}*/

	
	@Override
	public GuestDTO getModel() {
		return dto;
	}

	@Override
	public void prepare() throws Exception {
		dto = new GuestDTO();
	}
	
	public String created() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		CommonDAO dao = CommonDAOImpl.getInstance();
		
		int numMax = dao.getIntValue("iguest.numMax");
		
		dto.setNum(numMax + 1);
		dto.setIpAddr(request.getRemoteAddr());
		
		dao.insertData("iguest.insertData", dto);
		
		return list(); //��ȯ���� ����ã�ư������ϴ� list() �޼��带 ���ָ� �ȴ�.
		
	}
	
	public String list() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();//request�� �����°�
		
		// DB������
		CommonDAO dao = CommonDAOImpl.getInstance();
		
		MyUtil myUtil = new MyUtil();
		
		//����¡ ó��
		int numPerPage = 3;//�ϳ��� �������� ǥ���� ������ ����
		int totalPage = 0;
		int totalDataCount = 0;
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1; //currentPage�� 1�������� �Ѹ���.
		
		if(pageNum!=null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		totalDataCount = dao.getIntValue("iguest.dataCount");//ModelDriven�� �������ش�.
		
		if(totalDataCount!=0) {
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);
		}
		
		if(currentPage>totalPage) { //���������� �������������� ���� �������� ������
			currentPage = totalPage;
		}
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		//start�� end�� �Խù��� ���۰� ���� ����
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		hMap.put("start", start);//hMap�� start�� end�� ������
		hMap.put("end", end);
		
		//iguest�� listsData�� �����Ű�µ� hMap�� �Ѱ��ش�.
		List<Object> lists = dao.getListData("iguest.listData", hMap);
		
		
		//�Ϸù�ȣ ����
		int listNum,n = 0;
		
		Iterator<Object> it = lists.iterator();
		while(it.hasNext()) {
			
			GuestDTO vo = (GuestDTO)it.next();
			
			listNum = totalDataCount-(start+n-1);
			
			vo.setListNum(listNum);
			
			vo.setContent(vo.getContent().replaceAll("\n", "<br/>"));
			
			n++;
		}
		
		//JS�� ���� ����¡ ó�� ȣ��
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("totalDataCount", totalDataCount);
		request.setAttribute("pageNum", currentPage);
		
		return SUCCESS; // select�� �����̷�Ʈ�� �ʿ���⶧���� SUCCESS���� ��ȯ�ϸ� �ȴ�.
						// insert/delete�� �����̷�Ʈ�� �ʿ�
	}
	
	
	public String deleted() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		CommonDAO dao = CommonDAOImpl.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.deleteData("iguest.deleteData", num);
		
		return list();//��ȯ���� ����ã�ư������ϴ� list() �޼��带 ���ָ� �ȴ�.
		
	}
	
	

}
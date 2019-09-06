package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class UserLoginAction implements Action {
	protected String login;
	protected String id;
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");  //���� �α��� �� id
		id = request.getParameter("id");  //�����Ϸ��� ȸ���� id
		String type = null;
		if(request.getRequestURI().contains("delete")) {
			type = "����";
		} else if(request.getRequestURI().contains("update")) {
			type = "����";
		} else {
			type = "��ȸ";
		}
		
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α����� �ʿ��� �������Դϴ�.");
			request.setAttribute("url", "../board/main.do");
			return new ActionForward(false, "../alert.jsp");  //�޼��� ����.
		} else {
			if(!login.equals("admin") && !login.equals(id)) {
	            request.setAttribute("msg", "������ ������ " + type + " �����մϴ�.");
	            request.setAttribute("url", "../board/main.do");
	            return new ActionForward(false, "../alert.jsp");  //�޼��� ����.
	        }
		}
		return doExcute(request, response);  //�������� �ŷ��� ��� ȣ�� ��.
	}
	protected abstract ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

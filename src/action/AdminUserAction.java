package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//������ ������ ������ ó�����ִ� �߻�Ŭ���� �����
public abstract class AdminUserAction implements Action {
	protected String login;

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�����ڷ� �α��� �� �̿��ϼ���.");
			request.setAttribute("url", "../board/main.do");
			return new ActionForward(false, "../alert.jsp");
		} else if(!login.equals("admin")) {
			request.setAttribute("msg", "�����ڸ� ������ ������ �������Դϴ�.");
			request.setAttribute("url", "../board/main.do");
			return new ActionForward(false, "../alert.jsp");
		}
		return doExcute(request, response);
	}
	protected abstract ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

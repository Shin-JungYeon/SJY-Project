package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
	1. pass, chgpass(2�� �ʿ� x) �Ķ���� �� ����.
	2. pass ��й�ȣ�� db�� ����� ��й�ȣ��
		- �ٸ� : ��й�ȣ ���� �޼��� ���. -> passwordForm.jsp�� ������ �̵�.
	 	- ���� : ��й�ȣ ����. -> opener �������� info.jsp�� ������ �̵�. ���� �������� �ݱ�.
 */
public class PasswordAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α����� �ʿ��� �������Դϴ�..");
			request.setAttribute("url", "main.do");
			request.setAttribute("closable", true);
			return new ActionForward(false, "../alert.jsp");
		}
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())) {
			if(dao.updatePass(login, chgpass) > 0) {
				request.setAttribute("msg", "��й�ȣ ���濡 �����Ͽ����ϴ�.");
				request.setAttribute("url", "info.me?id=" + login);
				request.setAttribute("closable", true);
			} else {
				request.setAttribute("msg", "��й�ȣ ���濡 �����Ͽ����ϴ�.");
				request.setAttribute("url", "passwordForm.me?id=" + login);
			}
		} else {
			request.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.");
			request.setAttribute("url", "passwordForm.me?id=" + login);
		}
		return new ActionForward(false, "../alert.jsp");
	}
}

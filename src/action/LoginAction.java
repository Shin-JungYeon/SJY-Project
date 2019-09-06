package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * �α��� ó��
 * 	1. id, pass �Ķ���� ����.
 *  2. id ������ �Էµ� pass�� db�� ����� pass ��.
 *  	- id�� ���� ��� : ���̵� ���� �޼��� ��� �� loginForm.jsp�� �̵�.
 *  	- id�� �ִ� ���
 *  		- ��й�ȣ ��ġ : �α��� ���� session�� ����. �α��� �޼��� ��� �� main.me�� �̵�.
 *  		- ��й�ȣ ����ġ : ��й�ȣ ���� �޼��� ��� �� loginForm.jsp�� �̵�.
 */
public class LoginAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		String msg = "�ش� ���̵� �������� �ʽ��ϴ�. �ٽ� �Է����ּ���.";
		String url = "loginForm.jsp";
		
		if(mem != null) {  //id ����.
			if(!pass.equals(mem.getPass())) {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
			} else {
				msg = mem.getName() + "�� �ݰ����ϴ�.";
				url = "main.me";
				request.getSession().setAttribute("login", id);  //request ��ü�� ���ؼ� session ��ü �����;� ��.
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");  // ../ : ���� ���� �ٷ� ���� ������
		
	}
	
}

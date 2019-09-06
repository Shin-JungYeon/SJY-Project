package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 *  �α��� ����
 *  	- �Ϲ� ����� : ��й�ȣ ����. -> ��ġ�ϸ� db���� id�� �ش��ϴ� ���� ����.
 *  							   �α׾ƿ� �� Ż�𼺰� �޼��� ���. -> loginForm.jsp�� ������ �̵�.
 *  							   ���� ���н� ���� �޼��� ��� �� main.jsp�� ������ �̵�.
 *  						  -> ����ġ�ϸ� ��й�ȣ ����ġ �޼��� ��� �� deleteForm.jsp�� ������ �̵�.
 *  	- ������ : db���� �ش� id ���� ����.
 *  			 Ż�� ���� �޼��� ��� �� list.jsp�� ������ �̵�.
 *  			 ���� ���н� ���� �޼��� ��� �� list.jsp�� ������ �̵�.
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);  //Ż���Ϸ��� ȸ���� ����

		if(id.equals("admin")) {  //Ż���Ϸ��� id�� admin�� ��
			request.setAttribute("msg", "�����ڴ� Ż�� �Ұ��� �մϴ�.");
			request.setAttribute("url", "info.me?id=" + id);
			return new ActionForward(false, "../alert.jsp");
		}
		if(login.equals("admin") || pass.equals(mem.getPass())) {  //delete ������ ����.
			if(dao.delete(id) > 0) {  //���� ����
				if(login.equals("admin")) {
					request.setAttribute("msg", "�����ڿ� ���� " + id + "���� Ż�� �Ǿ����ϴ�.");
					request.setAttribute("url", "infoMem.me?mclass=" + mem.getMclass());	
				} else {
					request.setAttribute("msg", id + "���� Ż�� ���������� �Ϸ�Ǿ����ϴ�.");
					request.setAttribute("url", "main.me");
					request.getSession().invalidate();
				}
			} else {  //���� ����
				request.setAttribute("msg", "Ż�� �����Ͽ����ϴ�.");
				if(login.equals("admin")) {
					request.setAttribute("url", "infoMem.me?mclass=" + mem.getMclass());
				} else {
					request.setAttribute("url", "deleteForm.me?id=" + id);
				}	
			}
		} else {
			request.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.");
			request.setAttribute("url", "deleteForm.me?id=" + id);
		}
		return new ActionForward(false, "../alert.jsp");
	}
}

package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class SearchAction extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//column, find �Ķ���� �����ϱ�.
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		MemberDao dao = new MemberDao();
		List<Member> list = dao.searchlist(column, find);
		request.setAttribute("list", list);  //�Ӽ��� �̸��� �ݵ�� list���� ��. list.jsp ���� list�� �ۼ��س��ұ� ����.
		return new ActionForward(false, "list.jsp");  //false�� ���� .jsp, true�� .me false�� �ϰ� .me �� �ϸ� �Ӽ��� �޾Ƽ� �ٽ� ȣ���.
	}
}

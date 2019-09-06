package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeForm extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int bclass = Integer.parseInt(request.getParameter("bclass"));
		request.setAttribute("bclass", bclass);
		return new ActionForward(false, "noticeForm.do");
	}
}

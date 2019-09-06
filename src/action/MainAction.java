package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class MainAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login =(String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
			request.setAttribute("url", "loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, null);
	}
	
}

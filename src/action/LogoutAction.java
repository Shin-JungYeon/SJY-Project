package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 1. session 정보 clear.
 * 2. 로그아웃 메세지 출력, loginForm.jsp로 이동.
 */
public class LogoutAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		request.getSession().invalidate();
		String msg = login + "님 로그아웃 되었습니다.";
		String url = "loginForm.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}

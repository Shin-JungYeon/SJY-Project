package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * 로그인 처리
 * 	1. id, pass 파라미터 저장.
 *  2. id 정보로 입력된 pass와 db에 저장된 pass 비교.
 *  	- id가 없는 경우 : 아이디 없음 메세지 출력 후 loginForm.jsp로 이동.
 *  	- id가 있는 경우
 *  		- 비밀번호 일치 : 로그인 정보 session에 저장. 로그인 메세지 출력 후 main.me로 이동.
 *  		- 비밀번호 불일치 : 비밀번호 오류 메세지 출력 후 loginForm.jsp로 이동.
 */
public class LoginAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		String msg = "해당 아이디가 존재하지 않습니다. 다시 입력해주세요.";
		String url = "loginForm.jsp";
		
		if(mem != null) {  //id 존재.
			if(!pass.equals(mem.getPass())) {
				msg = "비밀번호가 틀렸습니다. 다시 입력해주세요.";
			} else {
				msg = mem.getName() + "님 반갑습니다.";
				url = "main.me";
				request.getSession().setAttribute("login", id);  //request 객체를 통해서 session 객체 가져와야 함.
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");  // ../ : 현재 폴더 바로 상위 폴더에
		
	}
	
}

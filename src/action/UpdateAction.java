package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
 * 
 * update.me 의 기능.
		1. 모든 파라미터를 Member 객체에 저장.
		2. 비밀번호 검증
			- 일치 : db 수정.
				- 성공 : 성공 메세지 출력 후 main.me로 페이지 이동.
				- 실패 : 실패 메세지 출력 후 updateForm.me로 페이지 이동.
			- 불일치 : 비밀번호 오류 메세지 출력 후 updateForm.me로 페이지 이동.
 */
public class UpdateAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response){
		String msg = "정보 수정에 실패하였습니다.";
		String url = "updateForm.me?id=" + id;
		try {
			Member mem = new Member();
			mem.setId(request.getParameter("id"));

			mem.setPass(request.getParameter("pass"));
			mem.setName(request.getParameter("name"));
			mem.setGender(Integer.parseInt(request.getParameter("gender")));
			mem.setPicture(request.getParameter("picture"));
			mem.setTel(request.getParameter("tel"));
			mem.setEmail(request.getParameter("email"));
			mem.setNick(request.getParameter("nick"));
			if(mem.getMclass() == 1) {
				String[] genres = request.getParameterValues("genre");
				String genre = "";
				for(String g : genres) {
					genre += g + ",";
				}
				mem.setGenre(genre);
			}
			MemberDao dao = new MemberDao();
			Member dbMem = dao.selectOne(mem.getId());
			if(login.equals("admin") || mem.getPass().equals(dbMem.getPass())) {
				if(dao.update(mem) > 0) {
					if(login.equals("admin")) {
						int mclass = Integer.parseInt(request.getParameter("mclass"));
						msg = "관리자에 의해 " + id + "님의 정보가 수정되었습니다.";
						url = "infoMem.me?mclass=" + mclass;
					} else {
						msg = "정보 수정이 성공적으로 완료되었습니다.";
						url = "info.me?id=" + id;
					}
				} else {
					msg = "정보 수정에 실패하였습니다.";
					url = "updateForm.me?id=" + id;
				}
			} else {
				msg = "비밀번호가 틀렸습니다. 다시 입력해주세요.";
				url = "updateForm.me?id=" + id;
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
		
	}
}


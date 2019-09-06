package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.Board;
import model.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	//�Խù� ��� �� ȣ��Ǵ� �޼���
	public ActionForward write (HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 100*1024*1024, "euc-kr");
			Board b = new Board();
			b.setName(multi.getParameter("name"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile(multi.getFilesystemName("file"));
			int num = dao.maxnum();
			b.setNum(++num);
			b.setRef(num);
			if(dao.insert(b)) {
				request.setAttribute("msg", "�Խù� ����� �Ϸ�Ǿ����ϴ�.");
				request.setAttribute("url", "list.do");
			} else {
				request.setAttribute("msg", "�Խù� ��Ͽ� �����Ͽ����ϴ�.");
				request.setAttribute("url", "writeForm.do");
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward list (HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;

		int boardcount = dao.boardCount(column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		List<Board> list = dao.list(pageNum, limit, column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardcount-((pageNum-1)*limit));
		return new ActionForward();
	}
	
	public ActionForward info (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		dao.readcntadd(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward boardDetail (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = dao.selectOne(num);
		request.setAttribute("b", board);
		return new ActionForward();
	}
	
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		try {
			String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
			MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
			
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setName(multi.getParameter("name"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile(multi.getFilesystemName("file1"));
			if(board.getFile() == null || board.getFile().equals("")) {
				board.setFile(multi.getParameter("file2"));
			}
			
			Board dbboard = dao.selectOne(board.getNum());
			String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
			String url = "updateForm.do?num=" + board.getNum();
//			if (board.getPass().equals(dbboard.getPass())) {
//				if(dao.update(board)) {
//					msg = "�Խù� ������ �Ϸ�Ǿ����ϴ�.";
//					url = "list.do";
//				} else {
//					msg = "�Խù� ������ �����Ͽ����ϴ�.";
//					url = "updateForm.do?num=" + board.getNum();
//				}
//			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
		String url = "deleteForm.do?num=" + num;
		Board dbboard = dao.selectOne(num);
		
//		if(pass.equals(dbboard.getPass())) {
//			if(dao.delete(num)) {
//				msg = "�Խù� ������ �Ϸ�Ǿ����ϴ�.";
//				url = "list.do";
//			} else {
//				msg = "�Խù� ������ �����Ͽ����ϴ�.";
//				url = "info.do?num=" + num;
//			}
//		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward reply (HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setRef(Integer.parseInt(request.getParameter("ref")));
		board.setReflevel(Integer.parseInt(request.getParameter("reflevel")));
		board.setRefstep(Integer.parseInt(request.getParameter("refstep")));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		request.setAttribute("msg", "��� ��Ͽ� �����Ͽ����ϴ�.");
		request.setAttribute("url", "replyForm.do?num=" + board.getNum());
		
		dao.refstepadd(board.getRef(), board.getRefstep());
		
		int num = dao.maxnum();
		board.setNum(++num);
		board.setReflevel(board.getReflevel() + 1);
		board.setRefstep(board.getRefstep() + 1);
		
		if(dao.insert(board)) {
			request.setAttribute("msg", "��� ����� �Ϸ�Ǿ����ϴ�.");
			request.setAttribute("url", "list.do");
		}
		return new ActionForward(false, "../alert.jsp");
	}
}

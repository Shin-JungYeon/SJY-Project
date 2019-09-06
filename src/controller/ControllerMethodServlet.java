package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.ProjectAllAction;

@WebServlet(urlPatterns = {"*.do"}, initParams = {@WebInitParam(name="properties", value="method.properties")})

public class ControllerMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties pr = new Properties();
	private ProjectAllAction action = new ProjectAllAction();
	private Class[] paramType = new Class[] {HttpServletRequest.class, HttpServletResponse.class};
	
    public ControllerMethodServlet() {
        super();
    }
    
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("properties");
		FileInputStream f = null;
		try {
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			pr.load(f);
			f.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("euc-kr");
        response.setContentType("text/html;charset=euc-kr");
    	Object[] paramObjs = new Object[] {request, response};
    	ActionForward forward = null;
    	String command = null;
    	try {
    		command = request.getRequestURI().substring(request.getContextPath().length());
    		//methodName : hello
    		String methodName = pr.getProperty(command);
    		//Method method = BoardAllAction.class.getMethod(methodName, paramType);
    		Method method = ProjectAllAction.class.getMethod(methodName, paramType);
    		//BoardAllAction.class : 클래스 정보 전달. 클래스 객체를 전달해줌.
    		//method : BoardAllAction 클래스의 hello 메서드 저장. 메서드 자체를 가지고 있음.
    		forward = (ActionForward) method.invoke(action, paramObjs);  //method.invoke : method를 호출하는 기능.
    	} catch(NullPointerException e) {
    		forward = new ActionForward(false, null);
    	} catch(Exception e) {
            throw new ServletException(e);
        }
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getView());
    		} else {
    			if(forward.getView() == null) {
    				forward.setView(command.replace(".do", ".jsp"));
    			}
    			RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
    			disp.forward(request, response);
    		}
    	} else {
    		response.sendRedirect("nopage.jsp");
    	}
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

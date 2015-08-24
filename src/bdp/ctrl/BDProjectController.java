package bdp.ctrl;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdp.action.Action;
import bdp.action.ActionForward;

/**
 * Servlet implementation class YSNAndroidController
 */
@WebServlet(urlPatterns = "/project", initParams={
		@WebInitParam(name="urlpattern", value="/bdp/conf/urlPatterns.properties")
})
public class BDProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static Map<String, Action> s_cMapAction = new HashMap<String, Action>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BDProjectController() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@SuppressWarnings("rawtypes")
	public void init(ServletConfig config) throws ServletException {
		// ���� �о���̴� �۾�	 ����
		String urlpattern = config.getInitParameter("urlpattern");
		// ������ �ҽ����� �����͸� Stream ������ ������ �鿩�´�.
		InputStream is = getClass().getResourceAsStream(urlpattern);
		java.util.Properties prop = new java.util.Properties();
		try {
			// �ε� 
			prop.load(is);
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		
		Iterator<Object> it = prop.keySet().iterator();
		while (it.hasNext()) {
			String cmd = (String) it.next();
			String action = prop.getProperty(cmd);
			System.out.println(cmd + " : " + action);
			
			try {
				// ���� Ŭ���� ��� ���� ������ Ŭ����ȭ �Ѵ�.
				Class actionClass = Class.forName(action);
				// �ν��Ͻ�ȭ �Ѵ�.
				Action actionObject = (Action) actionClass.newInstance();
				s_cMapAction.put(cmd, actionObject);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e){
				e.printStackTrace();
			}
		}// end of while
		
	}// end of met init

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println(uri);
		System.out.println(contextPath);
		//////////////////////////////////////////////
		String cmd = request.getParameter("cmd");
		//////////////////////////////////////////////
		System.out.println(cmd);
		Action action = s_cMapAction.get(cmd);
		
		ActionForward forward = action.execute(request, response);
		if (forward != null) {
			if (forward.isForward()) {
				// forwarding
				request.getRequestDispatcher(forward.getNextURL()).forward(request, response);
			} else {
				// redirecting
				response.sendRedirect(forward.getNextURL());
			}
		} else {
			System.out.println("forward is null");
		}
	}// end of met doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet �޼ҵ�� ����
		doGet(request, response);
	}// end of met doPost

}// end of servlet 

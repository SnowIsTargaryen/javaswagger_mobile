package javaa.swagger.listener;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.http.HttpRequest;

/**
 * Application Lifecycle Listener implementation class LoginListener
 *
 */

public class LoginListener implements HttpSessionListener {

	String path;
	String user_ID;
    /**
     * Default constructor. 
     * 
     *
     */
	public LoginListener( ){
		
	}
    public LoginListener(HttpServletRequest request) {
        // TODO Auto-generated constructor stub
    	
//    	user_ID = (String)((HttpServletRequest)request).getSession().getAttribute("user_ID");
//		
//    	path=request.getRealPath("webapp/resources/log");
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    
//    	System.out.println("no,접속자,접속시간,종료시간");
//    	System.out.println("listener: "+user_ID);
//    	System.out.println(se.getSession().getAttribute("user_ID"));
//    	System.out.println(se.getSession().getId());
    	//System.out.println(path);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}

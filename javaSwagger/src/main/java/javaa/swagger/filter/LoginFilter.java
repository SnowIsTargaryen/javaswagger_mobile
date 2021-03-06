package javaa.swagger.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

    /**
     * Default constructor.
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        // place your code here
        String user_ID = (String) ((HttpServletRequest) request).getSession().getAttribute("user_ID");
        System.out.println("filter: " + user_ID);
        String uri = ((HttpServletRequest) request).getRequestURI();
        //System.out.println(uri.contains("timeLine"));

        // pass the request along the filter chain
        if (user_ID != null) {
            chain.doFilter(request, response);
        } else {
            if (uri.contains("timeLine") == true) {
                ((HttpServletResponse) response).sendRedirect("login");
            } else {
                ((HttpServletResponse) response).sendRedirect("../login");
            }


        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}

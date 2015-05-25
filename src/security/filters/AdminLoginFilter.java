package security.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminLoginFilter
 */
public class AdminLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminLoginFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		Object isAdminLogin = session.getAttribute("isAdminLogin");
		System.out.println(isAdminLogin);
		if (isAdminLogin != null) {
			boolean isLogin = (boolean) isAdminLogin;
			if (isLogin) {
				// pass the request along the filter chain
				chain.doFilter(request, response);
			} else {
				synchronized (session) {
					session.setAttribute("fromAdminLoginFilter", "true");
				}
				httpResponse.sendRedirect("login.jsp");
			}
		} else {
			synchronized (session) {
				session.setAttribute("fromAdminLoginFilter", "true");
			}
			httpResponse.sendRedirect("login.jsp");
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

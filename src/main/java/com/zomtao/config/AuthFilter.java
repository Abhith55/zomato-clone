package com.zomtao.config;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import com.zomtao.constant.AppPathConstant;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter implements Filter {

	private static final List<String> Public_Paths = Arrays.asList(AppPathConstant.PUBLIC_URLS);

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String path = req.getRequestURI().replace(req.getContextPath(), "");
		HttpSession session = req.getSession(false);
		if (isPublicPath(path)) {
			chain.doFilter(request, response);
			return;
		}
		if (session != null
				&& (session.getAttribute("ADMIN") != null || session.getAttribute("RESTAURANT_OWNER") != null)) {
			chain.doFilter(request, response);
			System.out.println("Filtered Path: " + path + " | Session: " + session);
			System.out.println("Path: " + path);
			System.out.println("Session: " + session);
			System.out.println("Admin: " + (session != null ? session.getAttribute("ADMIN") : "null"));
			System.out.println("Owner: " + (session != null ? session.getAttribute("RESTAURANT_OWNER") : "null"));
			return;
		}
		res.sendRedirect(req.getContextPath() + AppPathConstant.LOGIN);

	}

	private boolean isPublicPath(String path) {
		// TODO Auto-generated method stub
		return Public_Paths.stream().anyMatch(path::startsWith) || path.endsWith(".css") || path.endsWith(".js")
				|| path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".jpeg") || path.endsWith(".gif")
				|| path.endsWith(".woff") || path.endsWith(".woff2") || path.endsWith(".ttf");
		// || path.contains("/layout/");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println(">>> AuthFilter initialized");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
}

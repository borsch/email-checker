package com.borsch.filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Oleh on 06.07.2017.
 */
public class CORSFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;

        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Credentials", "true");
        response.addHeader("Access-Control-Expose-Headers", "Content-Type, x-requested-by, Accept, x-requested-with,access_token, remember-me, Origin, x-customtoken");
        response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT");
        response.addHeader("Access-Control-Max-Age", "3600");
        response.addHeader("Access-Control-Allow-Headers", "Content-Type, x-requested-by, Accept, x-requested-with,access_token, remember-me, Origin, x-customtoken, Cache-Control");

        chain.doFilter(req, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}

}

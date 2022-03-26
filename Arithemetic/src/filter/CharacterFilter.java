package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterFilter implements Filter {

	private String encoding;

	@Override
	public void destroy() {
		this.encoding = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (encoding != null) {
			request.setCharacterEncoding(this.encoding);/* ��Ӧ�����ݱ����ʽ */
			response.setContentType("text/html;charset=" + encoding);/* ���������������Ӧ���������� */
		}
		/*
		 * �ڹ����������doFilter()�����У�ҵ���߼��������֮��
		 * ��Ҫͨ��FilterChain�����doFilter()���������󴫵ݵ���һ��������Ŀ����Դ�����򽫳��ִ���
		 */
		chain.doFilter(request, response);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
		System.out.println("��ʼ");
	}

}

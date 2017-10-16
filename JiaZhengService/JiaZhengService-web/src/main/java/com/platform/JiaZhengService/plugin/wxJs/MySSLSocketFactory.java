package com.platform.JiaZhengService.plugin.wxJs;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;

import org.apache.http.conn.ssl.SSLSocketFactory;

/**
 * 提供使用SSL或TLS协议的安全套接字 工厂类
 */
public class MySSLSocketFactory extends SSLSocketFactory {

	static {
		mySSLSocketFactory = new MySSLSocketFactory(createSContext());
	}

	private static MySSLSocketFactory mySSLSocketFactory = null;

	private static SSLContext createSContext() {
		SSLContext sslcontext = null;
		try {
			sslcontext = SSLContext.getInstance("SSL");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if (sslcontext != null) {
			try {
				sslcontext.init(null, new TrustManager[] { new TrustAnyTrustManager() }, null);
			} catch (KeyManagementException e) {
				e.printStackTrace();
				return null;
			}
		}
		return sslcontext;
	}

	private MySSLSocketFactory(SSLContext sslContext) {
		super(sslContext);
		this.setHostnameVerifier(ALLOW_ALL_HOSTNAME_VERIFIER);
	}

	public static MySSLSocketFactory getInstance() {
		if (mySSLSocketFactory != null) {
			return mySSLSocketFactory;
		} else {
			return mySSLSocketFactory = new MySSLSocketFactory(createSContext());
		}
	}

}

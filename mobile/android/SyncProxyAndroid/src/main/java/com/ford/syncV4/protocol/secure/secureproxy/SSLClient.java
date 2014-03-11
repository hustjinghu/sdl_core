package com.ford.syncV4.protocol.secure.secureproxy;

import android.util.Log;

import com.ford.syncV4.transport.ITransportListener;

import java.io.IOException;
import java.net.InetAddress;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

import javax.net.SocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * Created by Andrew Batutin on 3/11/14.
 */
public class SSLClient {

    private SSLSocket socket;
    ITransportListener transportListener;

    public SSLClient(ITransportListener transportListener) {
        this.transportListener = transportListener;
    }

    public void setupClient() throws IOException {
        SSLClientReader sslClientReader = new SSLClientReader();
        sslClientReader.start();
    }

    private void startSocket() throws IOException, NoSuchAlgorithmException, KeyManagementException {
        // Create a trust manager that does not validate certificate chains
        TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
            @Override
            public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
            }

            @Override
            public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
            }

            @Override
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return new java.security.cert.X509Certificate[] {};
            }
        } };

        SSLContext sc = SSLContext.getInstance("TLS");
        sc.init(null, trustAllCerts, new java.security.SecureRandom());
        SocketFactory sf = sc.getSocketFactory();
        InetAddress addr = InetAddress.getByName("127.0.0.1");
        socket = (SSLSocket) sf.createSocket(addr, 8090);
        socket.getSession();
        transportListener.onTransportConnected();

    }

    public synchronized void writeData(byte[] data) throws IOException {
        socket.getOutputStream().write(data);
    }

    public class SSLClientReader extends Thread {

        @Override
        public void run() {
            try {
                startSocket();

            } catch (IOException e) {
                Log.e("SecureProxyServer", "error", e);
            } catch (NoSuchAlgorithmException e) {
                Log.e("SecureProxyServer", "error", e);
            } catch (KeyManagementException e) {
                Log.e("SecureProxyServer", "error", e);
            }
        }
    }

}

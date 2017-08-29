package com.platform.JiaZhengService.common.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Utils - MD5
 */
public class MD5
{

    public static final int OXFF = 0xff;

    public static final int OX10 = 0x10;

    private static final String hexDigits[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d",
            "e", "f"};

    /**
	 * 
	 */
    private MD5()
    {

    }

    /**
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static String crypt(String str) throws NoSuchAlgorithmException
    {
        if (str == null || str.length() == 0)
        {
            throw new IllegalArgumentException("String to encript cannot be null or zero length");
        }

        StringBuffer hexString = new StringBuffer();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(str.getBytes());
        byte[] hash = md.digest();

        for (byte aHash : hash)
        {
            if ((OXFF & aHash) < OX10)
            {
                hexString.append("0").append(Integer.toHexString((OXFF & aHash)));
            }
            else
            {
                hexString.append(Integer.toHexString(OXFF & aHash));
            }
        }

        return hexString.toString();
    }

    /**
     * 签名字符串
     * 
     * @param text 需要签名的字符串
     * @param key 密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static String sign(String text, String key, String input_charset)
    {
        text = text + key;
        return DigestUtils.md5Hex(getContentBytes(text, input_charset));
    }

    /**
     * @param content
     * @param charset
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException
     */
    private static byte[] getContentBytes(String content, String charset)
    {
        if (charset == null || "".equals(charset))
        {
            return content.getBytes();
        }
        try
        {
            return content.getBytes(charset);
        }
        catch (UnsupportedEncodingException e)
        {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }

    /**
     * 签名字符串
     * 
     * @param text 需要签名的字符串
     * @param sign 签名结果
     * @param key 密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static boolean verify(String text, String sign, String key, String input_charset)
    {
        text = text + key;
        String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
        if (mysign.equals(sign))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private static String byteArrayToHexString(byte b[])
    {
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++)
            resultSb.append(byteToHexString(b[i]));

        return resultSb.toString();
    }

    private static String byteToHexString(byte b)
    {
        int n = b;
        if (n < 0)
            n += 256;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }

    public static String MD5Encode(String origin, String charsetname)
    {
        String resultString = null;
        try
        {
            resultString = new String(origin);
            MessageDigest md = MessageDigest.getInstance("MD5");
            if (charsetname == null || "".equals(charsetname))
                resultString = byteArrayToHexString(md.digest(resultString.getBytes()));
            else
                resultString = byteArrayToHexString(md.digest(resultString.getBytes(charsetname)));
        }
        catch (Exception exception)
        {
        }
        return resultString;
    }

    public static void main(String[] args)
    {
        try
        {
            System.out.println(MD5.crypt("appid=wx222cbd523cae37f0&attach=JSAPI&body=毛织哈伦裤黑色 S15562A&mch_id=10111105&nonce_str=1143452196&notify_url=http://192.168.2.236:8080/MoShop/payment/notify/async/2015091615655.jhtml&openid=oSJcuuJmOXzkF_0ObU2csyQ4EMdk&out_trade_no=2015091615655&spbill_create_ip=192.168.2.148&total_fee=139900&trade_type=JSAPI&key=005020150916MOCO20150916MOSHOP0051"));
        }
        catch (NoSuchAlgorithmException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

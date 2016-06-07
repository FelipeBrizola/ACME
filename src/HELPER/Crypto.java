/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HELPER;

import java.security.MessageDigest;

/**
 *
 * @author felipebrizola
 */
public class Crypto {
    public static String hashString(String message)
        throws Exception {
 
    try {
        MessageDigest digest = MessageDigest.getInstance("SHA-1");
        byte[] hashedBytes = digest.digest(message.getBytes("UTF-8"));
 
        return convertByteArrayToHexString(hashedBytes);
    } catch (Exception ex) {
        throw new Exception (
                "Could not generate hash from String", ex);
    }
}
    public static String convertByteArrayToHexString(byte[] arrayBytes) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < arrayBytes.length; i++) {
            stringBuffer.append(Integer.toString((arrayBytes[i] & 0xff) + 0x100, 16)
                .substring(1));
    }
    return stringBuffer.toString();
}
}

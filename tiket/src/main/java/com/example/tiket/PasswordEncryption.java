/* codingwill */
/* Password Encryption for Tiket Kereta*/

package com.example.tiket;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class PasswordEncryption {

    public static String hashPassword(String plainPassword, byte[] salt) {
        String securePassword = null;
        try {
            //Instansiasi objek password sha512 dengan algoritma SHA-512
            MessageDigest md5 = MessageDigest.getInstance("SHA-512");
            //Menambahkan plain password ke objek password sha512 yg ingin didigest/hash
            md5.update(salt);
            //melakukan digest/hashing dan return valuenya dalam bentuk byte array
            byte[] bytes = md5.digest();

            //Mengkonversi format byte sha512 dari desimal ke hex
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; ++i) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //assign password hasil hashing ke variabel secured_password
            securePassword = sb.toString();
            System.out.println("The encrypted pass: " + securePassword);
        } catch(NoSuchAlgorithmException err) {
            err.printStackTrace();
        }
        return securePassword;
    }

    //Generate salt value for more secure password hashing
    public static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }




    public static void main(String[] args) {
        try {
            System.out.println("Password SHA-512: " + hashPassword("tes", getSalt()));
        } catch (NoSuchAlgorithmException err) {
            err.printStackTrace();
        }
    }
}

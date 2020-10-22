import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class Blowfish {
    final protected static char[] hexArray = "0123456789ABCDEF".toCharArray();

    // Converts byte array to hex string
    // From:
    // http://stackoverflow.com/questions/9655181/convert-from-byte-array-to-hex-string-in-java
    public static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

    public static void main(String[] args) throws Exception {
        if ((args.length != 3) || !(args[0].equals("-e") | args[0].equals("-d"))) {
            System.out.println("Usage:\n\tjava JBlowfish <-e|-d> <encrypted_password>");
            return;
        }

        String mode = args[0];
        String aKey = args[2];
        // Configuration
        byte[] key = aKey.getBytes();
        String IV = "12345678";

        // Create new Blowfish cipher
        SecretKeySpec keySpec = new SecretKeySpec(key, "Blowfish");
        Cipher cipher = Cipher.getInstance("Blowfish/CBC/PKCS5Padding");
        String out = null;

        if (mode.equals("-e")) {
            String secret = args[1];
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, new javax.crypto.spec.IvParameterSpec(IV.getBytes()));
            byte[] encoding = cipher.doFinal(secret.getBytes());
            System.out.println(Base64.getEncoder().encodeToString(encoding));
        } else {
            // Decode Base64
            byte[] ciphertext = Base64.getDecoder().decode(args[1]);

            // Decrypt
            cipher.init(Cipher.DECRYPT_MODE, keySpec, new javax.crypto.spec.IvParameterSpec(IV.getBytes()));
            byte[] message = cipher.doFinal(ciphertext);
            System.out.println(new String(message));

        }
    }
}
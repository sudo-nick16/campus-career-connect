package com.sudonick.campuscareerconnect.utils;

import org.mindrot.jbcrypt.BCrypt;
public class HashUtils {
        public static String hashPassword(String password) {
            return BCrypt.hashpw(password, BCrypt.gensalt());
        }

        public static boolean verifyHash(String password, String hash){
            return BCrypt.checkpw(password, hash);
        }
}

package com.Benefits2PointOh.pims.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordGenerator {

    public static void main(String[] args) {

        String password = "admin123";

        String hash = BCrypt.hashpw(password, BCrypt.gensalt());

        System.out.println(hash);

    }

}
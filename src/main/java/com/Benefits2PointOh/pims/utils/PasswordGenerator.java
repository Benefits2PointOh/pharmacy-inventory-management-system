package com.Benefits2PointOh.pims.utils;

import java.io.Console;
import org.mindrot.jbcrypt.BCrypt;

/**
 * Local helper for generating a BCrypt hash without embedding a password in source.
 */
public class PasswordGenerator {

    public static void main(String[] args) {
        Console console = System.console();
        if (console == null) {
            throw new IllegalStateException("Run this helper from an interactive terminal.");
        }

        char[] password = console.readPassword("Password to hash: ");
        if (password == null || password.length == 0) {
            throw new IllegalArgumentException("A non-empty password is required.");
        }

        String hash = BCrypt.hashpw(new String(password), BCrypt.gensalt());
        System.out.println(hash);
    }
}

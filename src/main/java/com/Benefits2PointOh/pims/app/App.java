package com.Benefits2PointOh.pims.app;

import com.Benefits2PointOh.pims.ui.login.LoginFrame;
import javax.swing.SwingUtilities;

/*
 -- Application Entry Point
 */
public class App {

    public static void main(String[] args) {

        SwingUtilities.invokeLater(() -> {

            LoginFrame loginFrame = new LoginFrame();

            loginFrame.setVisible(true);

        });

    }

}
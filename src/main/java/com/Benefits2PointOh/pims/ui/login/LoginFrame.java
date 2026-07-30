package com.Benefits2PointOh.pims.ui.login;

import javax.swing.JFrame;

/*
-- LoginFrame
Displays the login screen for the Pharmacy Inventory Management System.
*/
public class LoginFrame extends JFrame {

    public LoginFrame() {

        initializeFrame();

    }

    /*
    setup main window.
    */
    private void initializeFrame() {

        setTitle("Pharmacy Inventory Management System");

        setSize(1100, 700);

        setLocationRelativeTo(null);

        setResizable(false);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }

}
package com.Benefits2PointOh.pims.ui.login;

import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.JPanel;
import com.Benefits2PointOh.pims.ui.theme.Theme;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

/*
-- LoginFrame
Displays the login screen for the Pharmacy Inventory Management System.
*/
public class LoginFrame extends JFrame {
    
    private JPanel leftPanel;
    private JPanel rightPanel;
    private JLabel titleLabel;
    
    public LoginFrame() {

        initializeFrame();
        initializePanels();
        initializeComponents();
        
        leftPanel.setBackground(Theme.PRIMARY);
        rightPanel.setBackground(Theme.BACKGROUND);

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
    
    /*
    -- initializePanels()
    Creates the main layout panels.
    */
    private void initializePanels() {

        leftPanel = new JPanel();
        rightPanel = new JPanel();

        leftPanel.setPreferredSize(new java.awt.Dimension(350, 700));

         getContentPane().setLayout(new BorderLayout());


        add(leftPanel, BorderLayout.WEST);
        add(rightPanel, BorderLayout.CENTER);
    }

    /*
    -- initializeComponents()
    Creates the UI components.
    */
    private void initializeComponents() {

        titleLabel = new JLabel(
                "Pharmacy Inventory Management System",
                SwingConstants.CENTER);

        titleLabel.setFont(Theme.TITLE_FONT);
    }

}
package com.Benefits2PointOh.pims.ui.theme;

import java.awt.Color;
import java.awt.Font;

/*
-- Theme
Stores colors and fonts used throughout the application.
*/
public final class Theme {

    private Theme() {}

    /* Colors */
    public static final Color PRIMARY = new Color(0x386641);
    public static final Color SECONDARY = new Color(0x6A994E);
    public static final Color ACCENT = new Color(0xA7C957);

    public static final Color BACKGROUND = Color.WHITE;
    public static final Color TEXT = new Color(0x333333);
    public static final Color BORDER = new Color(0xD9D9D9);

    /* Fonts */
    public static final Font TITLE_FONT =
            new Font("Segoe UI", Font.BOLD, 28);

    public static final Font HEADING_FONT =
            new Font("Segoe UI", Font.BOLD, 20);

    public static final Font LABEL_FONT =
            new Font("Segoe UI", Font.PLAIN, 14);

    public static final Font BUTTON_FONT =
            new Font("Segoe UI", Font.BOLD, 14);
}
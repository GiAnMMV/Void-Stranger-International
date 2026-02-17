// TARGET: LINENUMBER
// 87
        if (global.language < 2)
        {
// TARGET: LINENUMBER
// 92
        }
        else
        {
            draw_set_font(fnt_fakecredits);
            draw_set_halign(fa_left);
            draw_text_colour(17, 24, string_upper(scrScript(-347)), c_gray, c_gray, c_gray, c_gray, 1);
            for (var _i = 0; _i < 5 && _i < array_length(parts); _i++)
            {
                draw_text_colour(17, 40 + (16 * _i), parts[_i], c_dkgray, c_dkgray, c_ltgray, c_ltgray, 1);
            }
            draw_text_colour(17, 104, "TRANSLATION TOOL", c_black, c_black, c_gray, c_gray, 1);
            draw_text_colour(17, 120, "GIAMMARIA ANGELONI", c_dkgray, c_dkgray, c_ltgray, c_ltgray, 1);
        }
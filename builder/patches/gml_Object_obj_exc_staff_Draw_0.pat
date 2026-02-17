// TARGET: LINENUMBER
// 97
    if (global.language < 2)
    {
// TARGET: LINENUMBER
// 101
    }
    else
    {
        iy5 += string_height_ext(scrScript(7554), -1, 144);
        for (var _i = 0; _i < 5 && _i < array_length(parts); _i++)
        {
            draw_text_ext_color(ix, iy5 + 176 + 16, parts[_i], -1, 144, c, c, c, c, 1);
            iy5 += string_height_ext(parts[_i], -1, 144);
        }
        draw_text_ext_color(ix, iy5 + 176 + 32, scrScript(-349), -1, 144, cg, cg, cg, cg, 1);
        iy5 += string_height_ext(scrScript(-349), -1, 144);
        draw_text_ext_color(ix, iy5 + 176 + 32, "Giammaria Angeloni", -1, 144, c, c, c, c, 1);
    }
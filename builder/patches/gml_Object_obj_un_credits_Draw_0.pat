// TARGET: LINENUMBER_REPLACE
// 83
        if (global.language < 2)
        {
// TARGET: LINENUMBER
// 86
        }
        else
        {
            var _i;
            for (_i = 0; _i < 5 && _i < array_length(parts); _i++)
            {
                draw_text_color(208, 40 + (12 * _i), parts[_i], c, c, c, c, 1);
            }
            draw_text_color(208, 40 + (12 * ++_i), scrScript(-349), cg, cg, cg, cg, 1);
            draw_text_color(208, 40 + (12 * ++_i), "Giammaria Angeloni", cg, cg, cg, cg, 1);
        }
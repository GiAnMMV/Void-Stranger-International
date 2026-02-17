// TARGET: LINENUMBER_REPLACE
// 31
            draw_text_ext_color(tt_x + 60, tt_y + 8, scrScript(7500), -1, 136, c, c, c, c, title_fade);
// TARGET: LINENUMBER_REPLACE
// 37
            draw_text_ext_color(tt_x, tt_y, scrScript(7504), -1, 136, c, c, c, c, title_fade);
// TARGET: LINENUMBER_REPLACE
// 48
            draw_text_ext_color(tt_x, tt_y, scrScript(7505), -1, 136, c, c, c, c, title_fade);
// TARGET: LINENUMBER_REPLACE
// 60
            draw_text_ext_color(tt_x, tt_y, scrScript(7505), -1, 136, c, c, c, c, title_fade);
// TARGET: LINENUMBER_REPLACE
// 69
            draw_text_ext_color(tt_x, tt_y, scrScript(7506), -1, 136, c, c, c, c, title_fade);
// TARGET: LINENUMBER_REPLACE
// 81
            draw_text_ext_color(tt_x, tt_y, scrScript(7506), -1, 136, c, c, c, c, title_fade);
// TARGET: LINENUMBER_REPLACE
// 91:99
            var _y = tt_y;
            draw_set_halign(fa_left);
            draw_text_ext_color(tt_x, _y, scrScript(7507), -1, 136, c, c, c, c, title_fade);
            _y += string_height_ext(scrScript(7507), -1, 144);
            draw_set_halign(fa_left);
            draw_text_ext_color(tt_x, _y, scrScript(7524), -1, 136, c, c, c, c, text_fade);
            _y += 32;
            draw_text_ext_color(tt_x, _y, scrScript(7604), -1, 136, c, c, c, c, title_fade);
            _y += 16;
            draw_text_ext_color(tt_x, _y, scrScript(7605), -1, 136, c, c, c, c, title_fade);
            _y += 16;
            draw_text_ext_color(tt_x, _y, scrScript(7606), -1, 136, c, c, c, c, text_fade);
// TARGET: LINENUMBER_REPLACE
// 105:112
            draw_set_halign(fa_left);
            draw_text_ext_color(tt_x, tt_y, scrScript(7510), -1, 136, c, c, c, c, title_fade);
            draw_text_ext_color(tt_x, tt_y + 16, scrScript(7511), -1, 136, c, c, c, c, title_fade);
            draw_set_halign(fa_left);
            draw_text_ext_color(tt_x, tt_y + 48, scrScript(7555), -1, 136, c, c, c, c, text_fade);
            draw_text_ext_color(tt_x, tt_y + 64, scrScript(7558), -1, 136, c, c, c, c, text_fade);
            draw_text_ext_color(tt_x, tt_y + 80, " " + scrScript(7560), -1, 136, c, c, c, c, text_fade);
// TARGET: LINENUMBER
// 113
        case 67:
            draw_set_halign(fa_left);
            draw_text_ext_color(tt_x, tt_y, scrScript(7510), -1, 136, c, c, c, c, title_fade);
            draw_text_ext_color(tt_x, tt_y + 16, scrScript(7511), -1, 136, c, c, c, c, title_fade);
            draw_text_ext_color(tt_x, tt_y + 48, scrScript(7555), -1, 136, c, c, c, c, text_fade);
            for (var _i = 0; _i < 5 && _i < array_length(parts); _i++)
            {
                draw_text_ext_color(tt_x, tt_y + 64 + (16 * _i), parts[_i], -1, 136, c, c, c, c, text_fade);
            }
            break;
        case 68:
            var _y = tt_y;
            draw_set_halign(fa_left);
            draw_text_ext_color(tt_x, _y, scrScript(-349), -1, 136, c, c, c, c, title_fade);
            _y += string_height_ext(scrScript(-349), -1, 136);
            draw_text_ext_color(tt_x, _y, "Giammaria Angeloni", -1, 136, c, c, c, c, text_fade);
            break;
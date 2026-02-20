31c
            draw_text_ext_color(tt_x + 60, tt_y + 8, scrScript(7500), -1, 136, c, c, c, c, title_fade);
.
37c
            draw_text_ext_color(tt_x, tt_y, scrScript(7504), -1, 136, c, c, c, c, title_fade);
.
48c
            draw_text_ext_color(tt_x, tt_y, scrScript(7505), -1, 136, c, c, c, c, title_fade);
.
60c
            draw_text_ext_color(tt_x, tt_y, scrScript(7505), -1, 136, c, c, c, c, title_fade);
.
69c
            draw_text_ext_color(tt_x, tt_y, scrScript(7506), -1, 136, c, c, c, c, title_fade);
.
81c
            draw_text_ext_color(tt_x, tt_y, scrScript(7506), -1, 136, c, c, c, c, title_fade);
.
90a
            var _y = tt_y;
.
92,93c
            draw_text_ext_color(tt_x, _y, scrScript(7507), -1, 136, c, c, c, c, title_fade);
            _y += string_height_ext(scrScript(7507), -1, 144);
.
95,98c
            draw_text_ext_color(tt_x, _y, scrScript(7524), -1, 136, c, c, c, c, text_fade);
            _y += 32;
            draw_text_ext_color(tt_x, _y, scrScript(7604), -1, 136, c, c, c, c, title_fade);
            _y += 16;
            draw_text_ext_color(tt_x, _y, scrScript(7605), -1, 136, c, c, c, c, title_fade);
            _y += 16;
            draw_text_ext_color(tt_x, _y, scrScript(7606), -1, 136, c, c, c, c, text_fade);
.
102,103c
            draw_text_ext_color(tt_x, tt_y, scrScript(7510), -1, 136, c, c, c, c, title_fade);
            draw_text_ext_color(tt_x, tt_y + 16, scrScript(7511), -1, 136, c, c, c, c, title_fade);
.
105,107c
            draw_text_ext_color(tt_x, tt_y + 48, scrScript(7555), -1, 136, c, c, c, c, text_fade);
            draw_text_ext_color(tt_x, tt_y + 64, scrScript(7558), -1, 136, c, c, c, c, text_fade);
            draw_text_ext_color(tt_x, tt_y + 80, " " + scrScript(7560), -1, 136, c, c, c, c, text_fade);
            break;
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
.
// TARGET: LINENUMBER_REPLACE
// 182
            for (var i = offset_language; i < (offset_language + min(language_count, 4)); i += 1)
// TARGET: LINENUMBER_REPLACE
// 217
                    draw_text_color(112 + itx, 40 + ity + (csize * (i - offset_language)), ilanguage, ib, ib, ib, ib, 1);
// TARGET: LINENUMBER_REPLACE
// 219
                draw_text_color(112, 40 + (csize * (i - offset_language)), ilanguage, l_c[i], l_c[i], l_c[i], l_c[i], 1);
            }
            if (offset_language > 0)
            {
                draw_sprite_ext(spr_debug_arrow, 0, 113, 32, 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 0, 111, 32, 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 0, 112, 33, 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 0, 112, 31, 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 0, 112, 32, 1, 1, 0, c_gray, 1);
            }
            if ((offset_language + min(language_count, 4)) < language_count)
            {
                draw_sprite_ext(spr_debug_arrow, 1, 113, 48 + (csize * 4), 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 1, 111, 48 + (csize * 4), 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 1, 112, 49 + (csize * 4), 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 1, 112, 47 + (csize * 4), 1, 1, 0, c_black, 1);
                draw_sprite_ext(spr_debug_arrow, 1, 112, 48 + (csize * 4), 1, 1, 0, c_gray, 1);
143,155c
                    var ilanguage = global.script_array[current_val][4];
                    load_fonts(current_val);
                    draw_set_font(global.script_array[current_val][5][fnt_text_12]);
.
158a
                    draw_set_font(global.text_font);
.
606a
for (var i = 0; i < 9; i++)
{
    var ivn_char = string_char_at("vsI 3.1.0", i + 1);
    var isep = 0;
    if (ivn_char == ".")
    {
        isep = 2;
    }
    draw_text_color(2 + (8 * i) + isep, -5, ivn_char, vn_c, vn_c, vn_c, vn_c, 1);
}
.
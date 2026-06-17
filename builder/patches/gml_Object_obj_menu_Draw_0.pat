143,155c
                    var ilanguage = global.script_array[current_val][4];
                    draw_set_font(global.script_array[current_val][5][fnt_text_12]);
.
606a
for (var i = 0; i < 9; i++)
{
    var ivn_char = string_char_at("vsI 3.0.4", i + 1);
    var isep = 0;
    if (ivn_char == ".")
    {
        isep = 2;
    }
    draw_text_color(2 + (8 * i) + isep, -5, ivn_char, vn_c, vn_c, vn_c, vn_c, 1);
}
.
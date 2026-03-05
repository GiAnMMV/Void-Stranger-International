153c
                            ilanguage = scrScript(-2, current_val);
.
606a
for (var i = 0; i < 9; i++)
{
    var ivn_char = string_char_at("vsI 3.0.3", i + 1);
    var isep = 0;
    if (ivn_char == ".")
    {
        isep = 2;
    }
    draw_text_color(2 + (8 * i) + isep, -5, ivn_char, vn_c, vn_c, vn_c, vn_c, 1);
}
.
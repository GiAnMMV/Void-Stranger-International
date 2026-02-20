49a
var str="";
.
52,54d
57c
        str = scrScript(-350) + scrScript(3442);
.
61c
        str = scrScript(-350) + scrScript(pl_rand_line);
.
63d
67,69d
72c
        str = scrScript(-352) + scrScript(3451);
.
76c
        str = scrScript(-352) + scrScript(3452);
.
80c
        str = scrScript(-352) + scrScript(e_rand_line);
    }
}
if (str != "")
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    if (string_height_ext(str, string_height(global.text_font), 220) == string_height(global.text_font))
    {
        draw_sprite(spr_textbox_small, 0, 0, 0);
        draw_text_color(room_width * 0.5, 8, str, c_white, c_white, c_white, c_white, 1);
    }
    else
    {
        draw_sprite(spr_textbox_extra, 3, 0, 0);
        draw_text_ext_color(room_width * 0.5, 8, str, string_height(global.text_font), 220, c_white, c_white, c_white, c_white, 1);
        draw_sprite(spr_textbox_extra, 4, 0, 0);
.
1a
function load_fonts(arg0)
{
    if (array_length(global.script_array[arg0][5]) == 0)
    {
        var fonts = [];
        for (var _i = 0; font_exists(_i); _i++)
        {
            array_push(fonts, font_get_name(_i));
        }
        for (var _ifont = 0; _ifont < array_length(fonts); _ifont++)
        {
            if (file_exists(working_directory + "Languages\\" + global.script_array[arg0][0] + "\\" + fonts[_ifont] + ".ttf"))
            {
                draw_set_font(_ifont);
                array_push(global.script_array[arg0][5], font_add(working_directory + "Languages\\" + global.script_array[arg0][0] + "\\" + fonts[_ifont] + ".ttf", string_height(0) * 0.75, false, false, 32));
            }
            else
            {
                array_push(global.script_array[arg0][5], _ifont);
            }
        }
    }
}
.
1a
function load_fonts(arg0)
{
    if (is_undefined(global.script_array[arg0][5]))
    {
        var _arr = [];
        for (var _i = 0; _i < array_length(global.fonts); _i++)
        {
            array_push(_arr, _i);
        }
        var _font = file_find_first(working_directory + "Languages\\" + global.script_array[arg0][0] + "\\*.ttf", 0);
        while (_font != "")
        {
            _font = filename_change_ext(_font, "");
            for (var _ifont = 0; _ifont < array_length(global.fonts); _ifont++)
            {
                if (global.fonts[_ifont] == _font)
                {
                    draw_set_font(_ifont);
                    _arr[_ifont] = font_add(working_directory + "Languages\\" + global.script_array[arg0][0] + "\\" + _font + ".ttf", string_height(0) * 0.75, false, false, 32);
                    break;
                }
            }
            _font = file_find_next();
        }
        file_find_close();
        global.script_array[arg0][5];
    }
}

.
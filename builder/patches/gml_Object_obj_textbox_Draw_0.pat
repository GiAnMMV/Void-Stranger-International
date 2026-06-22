216,226c
    var _i = ds_map_find_first(global.script_array[global.language][6][1]);
    while (!is_undefined(_i))
    {
        if (ord(string_char_at(text_wrapped, counter)) == _i)
        {
            pause = true;
            alarm[1] = ds_map_find_value(global.script_array[global.language][6][1], _i);
            break;
        }
        _i = ds_map_find_next(global.script_array[global.language][6][1], _i);
    }
.
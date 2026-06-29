3,17c
    if (is_undefined(global.script_array[arg0][1]))
    {
        if (arg0 >= 2)
        {
            array_set(global.script_array[arg0], 1, global.txt_to_array(global.script_array[arg0][0], "included"));
            array_set(global.script_array[arg0], 2, global.txt_to_array(global.script_array[arg0][0], "extracted"));
        }
        else
        {
            var _grid = csv_to_grid("voidstranger_data.csv");
            array_set(global.script_array[0], 1, _grid[0]);
            array_set(global.script_array[0], 2, []);
            array_set(global.script_array[1], 1, _grid[1]);
            array_set(global.script_array[1], 2, []);
        }
    }
    if (is_undefined(global.script_array[arg0][6]))
    {
        var _arr = [0.5, ds_map_create()];
        ds_map_replace(_arr[1], ord(","), 16);
        var _filename = working_directory + "Languages\\" + global.script_array[arg0][0] + "\\config.ini";
        if (file_exists(_filename))
        {
            ini_open(_filename);
            _arr[0] = ini_read_real("General", "text_speed", 0.5);
            for (var _i = 1; ini_key_exists("Pauses", string(_i) + "_char"); _i++)
            {
                ds_map_replace(_arr[1], ini_read_real("Pauses", string(_i) + "_char"), ini_read_real("Pauses", string(_i) + "_time", 16));
            }
            ini_close();
        }
        global.script_array[arg0][6] = _arr;
    }
    global.load_fonts(arg0);
    global.language = arg0;
    global.text_font = global.script_array[arg0][5][fnt_text_12];
    global.text_speed = global.script_array[arg0][6][0];
.

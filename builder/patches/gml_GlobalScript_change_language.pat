3,17c
    if (is_undefined(global.script_array[arg0][1]))
    {
        array_set(global.script_array[arg0], 1, global.txt_to_array(global.script_array[arg0][0], "included"));
        array_set(global.script_array[arg0], 2, global.txt_to_array(global.script_array[arg0][0], "extracted"));
    }
    global.load_fonts(arg0);
    global.language = arg0;
    global.text_font = global.script_array[arg0][5][fnt_text_12];
.

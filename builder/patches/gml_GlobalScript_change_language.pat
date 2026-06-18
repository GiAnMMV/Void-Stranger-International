3,17c
    if (array_length(global.script_array[arg0][1]) == 0)
        array_set(global.script_array[arg0], 1, txt_to_array(global.script_array[arg0][0], "included"));
    if (array_length(global.script_array[arg0][2]) == 0)
        array_set(global.script_array[arg0], 2, txt_to_array(global.script_array[arg0][0], "extracted"));
    load_fonts(arg0);
    global.language = arg0;
    global.text_font = global.script_array[arg0][5][fnt_text_12];
.
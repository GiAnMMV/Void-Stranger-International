// TARGET: LINENUMBER_REPLACE
// 3
    var _res = string("[{0}]", argument[0]);
    var _lang = global.language;
    if (argument_count > 1)
        _lang = argument[1];
    if (argument[0] >= 1 && argument[0] <= array_length(global.script_array[_lang][1]))
        _res = global.script_array[_lang][1][argument[0] - 1];
    else if (argument[0] <= -1 && -argument[0] <= array_length(global.script_array[_lang][2]))
        _res = global.script_array[_lang][2][-argument[0] - 1];
    return _res;
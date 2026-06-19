3c
    var _res = "";
    if (argument[0] >= 1 && argument[0] <= array_length(global.script_array[global.language][1]))
    {
        _res = global.script_array[global.language][1][argument[0] - 1];
    }
    else if (argument[0] <= -1 && -argument[0] <= array_length(global.script_array[global.language][2]))
    {
        _res = global.script_array[global.language][2][-argument[0] - 1];
    }
    if (_res == "")
    {
        return string("{{0}}", argument[0]);
    }
    return _res;
.
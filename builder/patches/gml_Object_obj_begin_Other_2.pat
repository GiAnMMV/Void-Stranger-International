// TARGET: LINENUMBER_REPLACE
// 1
var language_codes = [];
var _code = file_find_first(working_directory + "Languages\\*", 16);
while (_code != "")
{
    if (string_length(_code) == 2 && string_upper(_code) == _code)
        array_push(language_codes, _code);    
    _code = file_find_next();
}
file_find_close();
array_sort(language_codes, true);
global.script_array = [["EN", [], ["ENGLISH"]], ["FI", [], ["SUOMI"]]];
var _grid = csv_to_grid("voidstranger_data.csv", true, "|", "~");
for (var _i = 0; _i < ds_grid_height(_grid); _i++)
{
    array_push(global.script_array[0][1], ds_grid_get(_grid, 0, _i));
    array_push(global.script_array[1][1], ds_grid_get(_grid, 1, _i));
}
for (var _i = 0; _i < array_length(language_codes); _i++)
{
    var _arr = [];
    array_push(_arr, language_codes[_i]);
    array_push(_arr, txt_to_array(language_codes[_i], "included"));
    array_push(_arr, txt_to_array(language_codes[_i], "extracted"));
    if (array_length(_arr[2]) == 0)
        array_push(_arr[2], language_codes[_i]);
    else if (_arr[2][0] == "")
        _arr[2][0] = language_codes[_i];    
    array_push(global.script_array, _arr);
}
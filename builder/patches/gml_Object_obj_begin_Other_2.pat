1c
var language_codes = [];
var _code = file_find_first(working_directory + "Languages\\*", 16);
while (_code != "")
{
    if (string_upper(_code) == _code || string_length(_code) == 2 || (string_length(_code) == 5 && string_char_at(_code, 3) == "-"))
        array_push(language_codes, string_upper(_code));
    _code = file_find_next();
}
file_find_close();
array_sort(language_codes, true);
global.script_array = [["EN", [], []], ["FI", [], []]];
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
    array_push(global.script_array, _arr);
}
var language_names = ds_grid_create(0, 1);
if (file_exists(working_directory + "Languages\\names.csv"))
{
    var csv = load_csv(working_directory + "Languages\\names.csv");
    if (ds_grid_width(csv) == (ds_grid_height(csv) - 1))
        language_names = csv;
}
for (var _i = 0; _i < array_length(global.script_array); _i++)
{
    array_push(global.script_array[_i], []);
    for (var _j = 0; _j < array_length(global.script_array); _j++)
    {
        if (array_length(global.script_array[_j][2]) > 0 && global.script_array[_j][2][0] != "")
            array_push(global.script_array[_i][3], global.script_array[_j][2][0]);
        else
            array_push(global.script_array[_i][3], global.script_array[_j][0]);
    }
    for (var _x = 0; _x < ds_grid_width(language_names); _x++)
    {
        if (ds_grid_get(language_names, _x, 0) == global.script_array[_i][0])
        {
            for (var _y = 1; _y < ds_grid_height(language_names); _y++)
            {
                for (var _j = 0; _j < array_length(global.script_array); _j++)
                {
                    if (ds_grid_get(language_names, _y - 1, 0) == global.script_array[_j][0])
                    {
                        array_set(global.script_array[_i][3], _j, ds_grid_get(language_names, _x, _y));
                        break;
                    }
                }
            }
            break;
        }
    }
}
.
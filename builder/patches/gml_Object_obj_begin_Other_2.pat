1c
var language_codes = [];
var _code = file_find_first(working_directory + "Languages\\*", 16);
while (_code != "")
{
    if (string_upper(_code) == _code)
        array_push(language_codes, string_upper(_code));
    _code = file_find_next();
}
file_find_close();
array_sort(language_codes, true);
array_insert(language_codes, 0, "EN");
array_insert(language_codes, 1, "FI");
var language_names = ds_grid_create(0, 1);
if (file_exists(working_directory + "Languages\\names.csv"))
{
    var csv = load_csv(working_directory + "Languages\\names.csv");
    if (ds_grid_width(csv) == ds_grid_height(csv))
    {
        ds_grid_destroy(language_names);
        language_names = csv;
    }
    else
    {
        ds_grid_destroy(csv);
    }
}
global.script_array = [];
for (var _i = 0; _i < array_length(language_codes); _i++)
{
    var _arr = [];
    array_push(_arr, language_codes[_i]);
    array_push(_arr, []);
    array_push(_arr, []);
    array_push(_arr, []);
    for (var _j = 0; _j < array_length(language_codes); _j++)
    {
        array_push(_arr[3], language_codes[_j]);
    }
    array_push(_arr, language_codes[_i]);
    var _x = ds_grid_width(language_names);
    while (--_x >= 1)
    {
        if (ds_grid_get(language_names, _x, 0) == language_codes[_i])
        {
            array_set(_arr, 4, ds_grid_get(language_names, 0, _x));
            break;
        }
    }
    for (var _y = 1; _y < ds_grid_height(language_names); _y++)
    {
        for (var _j = 0; _j < array_length(language_codes); _j++)
        {
            if (ds_grid_get(language_names, _y, 0) == language_codes[_j] && _x)
            {
                array_set(_arr[3], _j, ds_grid_get(language_names, _x, _y));
                break;
            }
        }
    }
    array_push(_arr, []);
    array_push(global.script_array, _arr);
}
ds_grid_destroy(language_names);
var _grid = csv_to_grid("voidstranger_data.csv", true, "|", "~");
for (var _i = 0; _i < ds_grid_height(_grid); _i++)
{
    array_push(global.script_array[0][1], ds_grid_get(_grid, 0, _i));
    array_push(global.script_array[1][1], ds_grid_get(_grid, 1, _i));
}
global.fonts = [];
for (var _i = 0; font_exists(_i); _i++)
{
    array_push(global.fonts, font_get_name(_i));
}
.
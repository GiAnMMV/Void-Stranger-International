// TARGET: LINENUMBER
// 9
offset_language = 0;
if (any_settings_file_exists())
{
    current_language = global.language + 1;
}
else
{
    for (var _i = 0; _i < array_length(global.script_array); _i++)
    {
        if (global.script_array[_i][0] == string_upper(os_get_language()))
        {
            current_language = _i + 1;
            break;
        }
    }
}
while (current_language > (offset_language + 4))
{
    offset_language++;
}
// TARGET: LINENUMBER_REPLACE
// 57:60
language_count = array_length(global.script_array);
for (var _i = 0; _i < language_count; _i++)
{
    language_option[_i] = scrScript(-1, _i);
}
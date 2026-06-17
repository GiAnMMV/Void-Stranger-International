8a
offset_language = 0;
if (any_settings_file_exists())
{
    current_language = global.language + 1;
}
while (current_language > (offset_language + 4))
{
    offset_language++;
}
.
37,39c
language_count = array_length(global.script_array);
for (var _i = 0; _i < language_count; _i++)
{
    language_option[_i] = global.script_array[_i][3][_i];
}
.
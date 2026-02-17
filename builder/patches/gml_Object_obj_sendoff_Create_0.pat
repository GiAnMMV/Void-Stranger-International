// TARGET: LINENUMBER
// 254
if (global.language >= 2)
{
    array_delete(credits_name, 127, 2);
    array_delete(credits_list, 128, 1);
    var parts = string_split(scrScript(-348), "|");
    array_insert(credits_name, 127, parts[0]);
    var _i;
    for (_i = 1; _i < 5 && _i < array_length(parts); _i++)
    {
        array_insert(credits_list, 127 + _i, 0);
        array_insert(credits_name, 127 + _i, parts[_i]);
    }
    array_insert(credits_list, 127 + _i, 0, scrScript(-349), 0, 0, 0, 0, 0, 0, 0, 0);
    array_insert(credits_name, 127 + _i, 0, "Giammaria Angeloni", 0, 0, 0, 0, 0, 0, 0, 0);
    credits_length += (_i + 8);
}
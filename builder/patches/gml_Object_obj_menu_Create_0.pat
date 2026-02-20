42c
var _lang_arr = [];
for (var _i = 0; _i < array_length(global.script_array); _i++)
{
    array_push(_lang_arr, scrScript(-1, _i));
}
ds_menu_language = create_menu_page([scrScript(31), UnknownEnum.Value_3, "change_language", 0, _lang_arr], [scrScript(7), UnknownEnum.Value_1, UnknownEnum.Value_1]);
.
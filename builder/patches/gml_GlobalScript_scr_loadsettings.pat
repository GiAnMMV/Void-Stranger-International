// TARGET: LINENUMBER_REPLACE
// 37
                var _language_selection = 0;
                if (ini_key_exists("Save1", "language_code"))
                {
                    var _language_code = ini_read_string("Save1", "language_code", "");
                    for (var _i = 0; _i < array_length(global.script_array); _i++)
                    {
                        if (global.script_array[_i][0] == _language_code)
                        {
                            _language_selection = _i;
                            break;
                        }
                    }
                }
                else
                {
                    _language_selection = ini_read_real("Save1", "language_selection", 0);
                }

// TARGET: LINENUMBER_REPLACE
// 238
                var _lang_arr = [];
                for (var _i = 0; _i < array_length(global.script_array); _i++)
                {
                    array_push(_lang_arr, scrScript(-1, _i));
                }
                ds_grid_set(obj_menu.ds_menu_language, 4, 0, _lang_arr);

// TARGET: LINENUMBER_REPLACE
// 245
                ds_grid_set(obj_menu.ds_menu_language, 3, 0, global.language);


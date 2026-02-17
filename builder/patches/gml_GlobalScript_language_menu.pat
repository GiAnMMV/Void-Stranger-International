// TARGET: LINENUMBER_REPLACE
// 30
        case 0:

// TARGET: LINENUMBER
// 38
            break;
        default:
            ds_grid_set(obj_menu.ds_menu_graphics, 0, 2, scrScript(-3));
            ds_grid_set(obj_menu.ds_menu_graphics, 4, 2, [scrScript(-4), scrScript(-5)]);
            ds_grid_set(obj_menu.ds_menu_graphics, 0, 3, scrScript(-6));
            ds_grid_set(obj_menu.ds_menu_graphics, 4, 3, [scrScript(-7), scrScript(-8)]);
            ds_grid_set(obj_menu.ds_menu_graphics, 0, 4, scrScript(-9));
            ds_grid_set(obj_menu.ds_menu_graphics, 0, 5, scrScript(-10));
            ds_grid_set(obj_menu.ds_menu_graphics, 4, 5, [scrScript(-11), scrScript(-12), scrScript(-13)]);

// TARGET: LINENUMBER_REPLACE
// 72
    var _lang_arr = [];
    for (var _i = 0; _i < array_length(global.script_array); _i++)
        array_push(_lang_arr, scrScript(-1, _i));
    ds_grid_set(obj_menu.ds_menu_language, 4, 0, _lang_arr);
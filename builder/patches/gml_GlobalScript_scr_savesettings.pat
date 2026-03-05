62a
            var _Language_gstring_old = ds_grid_create(1, 1);
            ds_grid_add(_Language_gstring_old, 0, 0, 0);
            ds_grid_add(_Language_gstring_old, 0, 1, 1);
.
89c
            ini_write_real("Save1", "language_selection", 0);
            ini_write_string("Save1", "language_code", global.script_array[global.language][0]);
.
94c
            ini_write_string("Save1", "Language Settings", ds_grid_write(_Language_gstring_old));
            ini_write_string("Save1", "Language Settings New", ds_grid_write(_Language_gstring));
.
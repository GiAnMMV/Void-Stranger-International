1a
function txt_to_array(arg0, arg1)
{
    var _fname = working_directory + "Languages\\" + arg0 + "\\" + arg1 + ".txt";
    if (!file_exists(_fname))
        return [];
    var _buffer = buffer_load(_fname);
    if (buffer_get_size(_buffer) >= 3)
    {
        var _b0 = buffer_peek(_buffer, 0, buffer_u8);
        var _b1 = buffer_peek(_buffer, 1, buffer_u8);
        var _b2 = buffer_peek(_buffer, 2, buffer_u8);
        if (_b0 == 239 && _b1 == 187 && _b2 == 191)
            buffer_seek(_buffer, buffer_seek_start, 3);
    }
    var _res = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    _res = string_replace_all(_res, "\r", "");
    _res = string_split(_res, "\n");
    return _res;
}
.
1,439c
function csv_to_grid(arg0)
{
    if (!file_exists(arg0))
        return [];
    var _encrypted_dict = "TGöAÖWaFenR)gqfvNHy]b!'8Zt?Åc*o9X,YE0uIx6-ÄQäwCh51`DlBjO3iJ.åkz KSsPm4(LrdV2U[´p7M";
    var _decrypted_dict = " !'()*,-.0123456789?ABCDEFGHIJKLMNOPQRSTUVWXYZ[]`abcdefghijklmnopqrstuvwxyz´ÄÅÖäåö";
    var _buffer = buffer_load(arg0);
    if (buffer_get_size(_buffer) >= 3)
    {
        var _b0 = buffer_peek(_buffer, 0, buffer_u8);
        var _b1 = buffer_peek(_buffer, 1, buffer_u8);
        var _b2 = buffer_peek(_buffer, 2, buffer_u8);
        if (_b0 == 239 && _b1 == 187 && _b2 == 191)
            buffer_seek(_buffer, buffer_seek_start, 3);
    }
    var _raw_text = buffer_read(_buffer, buffer_text);
    _raw_text = string_replace_all(_raw_text, "\r", "");
    var _raw_lines = string_split(_raw_text, "\n");
    var _length = array_length(_raw_lines);
    var _res = [[], []];
    for (var i = 0; i < _length; i++)
    {
        var _parts = string_split(_raw_lines[i], "|");
        for (var j = 0; j < array_length(_parts); j++)
        {
            var _part = _parts[j];
            buffer_seek(_buffer, buffer_seek_start, 0);
            var _part_length = string_length(_part);
            for (var k = 0; k < _part_length; k++)
            {
                var _char = string_char_at(_part, ((k == 0) ? k : (_part_length - k)) + 1);
                var _dict_pos = string_pos(_char, _encrypted_dict);
                if (_dict_pos != 0)
                {
                    _char = string_char_at(_decrypted_dict, _dict_pos);
                }
                buffer_write(_buffer, buffer_text, _char);
            }
            buffer_write(_buffer, buffer_u8, 0);
            buffer_seek(_buffer, buffer_seek_start, 0);
            _res[j][i] = buffer_read(_buffer, buffer_string);
        }
    }
    buffer_delete(_buffer);
    return _res;
}
.
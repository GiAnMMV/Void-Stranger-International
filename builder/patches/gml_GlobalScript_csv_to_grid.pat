1,439c
{
    if (!file_exists(arg0))
        return [[], []];
    var _dec_lookup = [
        $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F,
        $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F,
        $6F, $42, $22, $23, $24, $25, $26, $43, $76, $32, $4A, $2B, $4E, $56, $6B, $2F,
        $51, $61, $B4, $68, $75, $60, $55, $E5, $44, $4C, $3A, $3B, $3C, $3D, $3E, $47,
        $40, $28, $65, $5B, $63, $50, $2D, $21, $38, $53, $6A, $70, $77, $F6, $37, $67,
        $73, $58, $31, $71, $20, $C4, $7A, $2A, $4D, $4F, $45, $C5, $5C, $3F, $5E, $5F,
        $62, $2C, $41, $49, $79, $2E, $35, $33, $5D, $69, $66, $6D, $64, $74, $30, $4B,
        $E4, $34, $78, $72, $46, $52, $36, $5A, $54, $39, $6E, $7B, $7C, $7D, $7E, $7F,
        $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F,
        $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F,
        $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
        $B0, $B1, $B2, $B3, $D6, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
        $C0, $C1, $C2, $C3, $57, $48, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF,
        $D0, $D1, $D2, $D3, $D4, $D5, $29, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF,
        $E0, $E1, $E2, $E3, $59, $6C, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF,
        $F0, $F1, $F2, $F3, $F4, $F5, $27, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
    ];
    var _res = [array_create(7614, 0), array_create(7614, 0)];
    var _buffer = buffer_load(arg0);
    var _buffer_size = buffer_get_size(_buffer);
    var _buffer_temp = buffer_create(1024, buffer_grow, 1);
    var _buffer_accum = buffer_create(1024, buffer_fast, 1);
    var _row = 0;
    var _col = 0;
    if (_buffer_size >= 3)
    {
        var _b0 = buffer_peek(_buffer, 0, buffer_u8);
        var _b1 = buffer_peek(_buffer, 1, buffer_u8);
        var _b2 = buffer_peek(_buffer, 2, buffer_u8);
        if (_b0 == $EF && _b1 == $BB && _b2 == $BF)
            buffer_seek(_buffer, buffer_seek_start, 3);
    }
    while (buffer_tell(_buffer) < _buffer_size)
    {
        var _unicode = buffer_read(_buffer, buffer_u8);
        if ((_unicode & $E0) == $C0)
            _unicode = ((_unicode & $1F) << 6) + (buffer_read(_buffer, buffer_u8) & $3F);
        else if (_unicode > $7F)
            continue;
        if (_unicode == ord("|") || _unicode == ord("\n"))
        {
            buffer_seek(_buffer_temp, buffer_seek_start, 0);
            if (buffer_tell(_buffer_accum) > 0)
            {
                buffer_write(_buffer_temp, buffer_text, chr(buffer_peek(_buffer_accum, 0, buffer_u8)));
                buffer_seek(_buffer_accum, buffer_seek_relative, -1);
                while (buffer_tell(_buffer_accum) > 0)
                {
                    buffer_write(_buffer_temp, buffer_text, chr(buffer_read(_buffer_accum, buffer_u8)));
                    buffer_seek(_buffer_accum, buffer_seek_relative, -2);
                }
            }
            buffer_write(_buffer_temp, buffer_u8, 0);
            buffer_seek(_buffer_temp, buffer_seek_start, 0);
            _res[_col][_row] = buffer_read(_buffer_temp, buffer_string);
            if (_unicode == ord("|"))
                _col++;
            else
            {
                _col = 0;
                _row++;
            }
        }
        else if (_unicode != ord("\r") && _unicode < $100)
            buffer_write(_buffer_accum, buffer_u8, _dec_lookup[_unicode]);
    }
    buffer_seek(_buffer_temp, buffer_seek_start, 0);
    if (buffer_tell(_buffer_accum) > 0)
    {
        buffer_write(_buffer_temp, buffer_text, chr(buffer_peek(_buffer_accum, 0, buffer_u8)));
        buffer_seek(_buffer_accum, buffer_seek_relative, -1);
        while (buffer_tell(_buffer_accum) > 0)
        {
            buffer_write(_buffer_temp, buffer_text, chr(buffer_read(_buffer_accum, buffer_u8)));
            buffer_seek(_buffer_accum, buffer_seek_relative, -2);
        }
    }
    buffer_write(_buffer_temp, buffer_u8, 0);
    buffer_seek(_buffer_temp, buffer_seek_start, 0);
    _res[_col][_row] = buffer_read(_buffer_temp, buffer_string);
    if (array_length(_res[0]) > ++_row)
    {
        array_resize(_res[0], _row);
        array_resize(_res[1], _row);
    }
    buffer_delete(_buffer);
    buffer_delete(_buffer_temp);
    buffer_delete(_buffer_accum);
    return _res;
}
.
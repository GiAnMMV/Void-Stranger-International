// TARGET: REPLACE
function txt_to_array(arg0, arg1)
{
    var _res = [];
    var _val = 0;
    var _str = "";
    var _fname = working_directory + "Languages\\" + arg0 + "\\" + arg1 + ".txt";
    
    if (file_find_first(_fname) == "")
    {
        file_find_close();
        return _res;
    }
    
    file_find_close();
    var _buffer = buffer_load(_fname);
    var _size = buffer_get_size(_buffer);
    
    for (var _i = 0; _i < _size; _i++)
    {
        _val = buffer_read(_buffer, buffer_u8);
        
        if ((_val & 224) == 192)
        {
            _val = (_val & 31) << 6;
            _val += (buffer_read(_buffer, buffer_u8) & 63);
            _i++;
        }
        else if ((_val & 240) == 224)
        {
            _val = (_val & 15) << 12;
            _val += ((buffer_read(_buffer, buffer_u8) & 63) << 6);
            _val += (buffer_read(_buffer, buffer_u8) & 63);
            _i += 2;
        }
        else if ((_val & 248) == 240)
        {
            _val = (_val & 7) << 18;
            _val += ((buffer_read(_buffer, buffer_u8) & 63) << 12);
            _val += ((buffer_read(_buffer, buffer_u8) & 63) << 6);
            _val += (buffer_read(_buffer, buffer_u8) & 63);
            _i += 3;
        }
        else if (_val == 13)
        {
            _val = buffer_read(_buffer, buffer_u8);
            _i++;
        }
        
        if (_val == 10)
        {
            array_push(_res, _str);
            _str = "";
        }
        else
        {
            _str += chr(_val);
        }
    }
    
    array_push(_res, _str);
    buffer_delete(_buffer);
    return _res;
}

// TARGET: LINENUMBER
// 246
            if (offset_language >= current_language)
            {
                offset_language--;
            }
// TARGET: LINENUMBER
// 259
            if ((offset_language + min(language_count, 4)) < current_language)
            {
                offset_language++;
            }
// TARGET: LINENUMBER_REPLACE
// 279
    if (display_text == false && first_input == false)
245a
            if (offset_language >= current_language)
            {
                offset_language--;
            }
.
254a
            if ((offset_language + min(language_count, 4)) < current_language)
            {
                offset_language++;
            }
.
271c
    if (display_text == false && first_input == false)
.
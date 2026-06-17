246c
            if (offset_language >= current_language)
            {
                offset_language--;
            }
.
255c
            if ((offset_language + min(language_count, 4)) < current_language)
            {
                offset_language++;
            }
.
265a
                event_perform(ev_other, ev_user0);
.
271c
    if (display_text == false && first_input == false)
.
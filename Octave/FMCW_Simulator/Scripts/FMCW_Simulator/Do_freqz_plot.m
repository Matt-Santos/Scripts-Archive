function Do_freqz_plot(w,h);
    if (is_octave())
        freqz_plot(w,h);
    else
        fvtool(w,h);
    end
end
function time_string=sec2hms(time_in_secs)
    nhours = floor(time_in_secs/3600);
    nmins = floor((time_in_secs - 3600*nhours)/60);
    nsecs = time_in_secs - 3600*nhours - 60*nmins;
    
    time_string = sprintf('%02u:%02u:%04.1f', nhours, nmins, nsecs);
end
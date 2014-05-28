function time_string = sec2hms( time_in_secs )
% converts a time in seconds (ie from timing something) into a an
% HH:MM:SS.S format
%
% Inputs:
%     - time_in_secs: the input time in seconds
% Output:
%     - time_string: a string with the formatted time
    nhours = floor(time_in_secs/3600);
    nmins = floor((time_in_secs - 3600*nhours)/60);
    nsecs = time_in_secs - 3600*nhours - 60*nmins;
    
    time_string = sprintf('%02u:%02u:%04.1f', nhours, nmins, nsecs);
end
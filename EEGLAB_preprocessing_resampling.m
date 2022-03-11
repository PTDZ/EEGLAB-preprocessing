%%  Resampling
% For all files stored in ALLEEG structure

for ii = 1:numel(ALLEEG)  
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',ii,'study',0);
    
        newName=sprintf('%s_resam',ALLEEG(ii).setname);

        % Choose new sampling rate, e.g. 500 Hz
        EEG = pop_resample( EEG, 500);
        
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname',newName,'gui','off'); 

    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end
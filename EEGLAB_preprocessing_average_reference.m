%% Re-refence to average reference
%  For all files stored in ALLEEG structure (EEGLAB)

for ii = 1:numel(ALLEEG)  
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',ii,'study',0);
        
        newName=sprintf('%s_avg_ref',ALLEEG(ii).setname);
        EEG = pop_reref( EEG, []);
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname',newName,'gui','off'); 

    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end

%% Delete original data

alleegStructLength = numel(ALLEEG);

for ii = alleegStructLength:-1:1
    if strcmp(ALLEEG(ii).ref,'common')
        ALLEEG(ii) = [];
    end      
end
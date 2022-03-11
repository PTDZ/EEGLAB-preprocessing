%% Make epochs based on chosen event and time (here: 0-1; event name 'sample_event'
% For all files stored in ALLEEG structure

for ii = 1:numel(ALLEEG)  
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',ii,'study',0);   

    newName=sprintf('%s_epoch',ALLEEG(ii).setname);
    EEG = eeg_checkset( EEG );
    EEG = pop_epoch( EEG, {  'sample_event'  }, [0  1], 'newname', newName, 'epochinfo', 'yes');
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname',newName,'gui','off'); 

    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end

%% Epoch-2-continious data
% For all files stored in ALLEEG structure

for ii = 1:numel(ALLEEG)  
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',ii,'study',0);
   
    newName=sprintf('%s_contin',ALLEEG(ii).setname);
    EEG = eeg_checkset(EEG);    
    EEG = epoch2continuous(EEG);
    
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname',newName,'gui','off'); 
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end

%% Remove boundary events 
% For all files stored in ALLEEG structure

alleegStructLength = numel(ALLEEG);
for ii = alleegStructLength:-1:1
    fixedEvents = numel(ALLEEG(ii).event);
        for kk = fixedEvents:-1:1
            tf = isequal(ALLEEG(ii).event(kk).type,'boundary');
                if tf == 1
                     ALLEEG(ii).event(kk) = [];
                end     
        end
end




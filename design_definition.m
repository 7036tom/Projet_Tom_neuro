durations = {6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6};
names = {'ambient1', 'ambient2', 'ambient3', 'ambient4', 'ambient5', 'symphonic1', 'symphonic2', 'symphonic3', 'symphonic4', 'symphonic5', 'country1', 'country2', 'country3', 'country4', 'country5',  'rocknroll1', 'rocknroll2', 'rocknroll3', 'rocknroll4', 'rocknroll5', 'metal1', 'metal2', 'metal3', 'metal4', 'metal5' };

for j = 1:8
    
    filename = sprintf('Behav/behavdata.txt.%d', j-1);
    fid = fopen(filename);
	data = textscan(fid,'%s%s%s');
    
    %onsets = cell(1,25);
   
    zero = 0;
    
    for i=2:26
        temp = data{1}(i); % We read one line of the behav file
        temp_2 = temp{1};
        temp_3 = strsplit(temp_2, ',');
        
        if i == 2
            zero =  str2double(temp_3(10));
        end
        
        % We look at the song name and compute onsets accordingly.
        if strcmp(temp_3(5), '"ambient_000.wav"')
            a1 = str2double(temp_3(10))- zero;
          
        end 
        
        if strcmp(temp_3(5), '"ambient_001.wav"')
            a2 = str2double(temp_3(10))- zero;
        end 
        
        if strcmp(temp_3(5), '"ambient_002.wav"')
            a3 = str2double(temp_3(10))- zero;
        end 
        
        if strcmp(temp_3(5), '"ambient_003.wav"')
            a4 = str2double(temp_3(10))- zero;
        end 
        
        if strcmp(temp_3(5), '"ambient_004.wav"')
            a5 = str2double(temp_3(10))- zero;
        end 
              
        if strcmp(temp_3(5), '"symphonic_000.wav"')
            a6 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"symphonic_001.wav"')
            a7 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"symphonic_002.wav"')
            a8 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"symphonic_003.wav"')
            a9 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"symphonic_004.wav"')
            a10 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"country_000.wav"')
            a11 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"country_001.wav"')
            a12 = [str2double(temp_3(10)) - zero];
        end
        
        if strcmp(temp_3(5), '"country_002.wav"')
            a13 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"country_003.wav"')
            a14 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"country_004.wav"')
            a15 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"rocknroll_000.wav"')
            a16 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"rocknroll_001.wav"')
            a17 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"rocknroll_002.wav"')
            a18 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"rocknroll_003.wav"')
            a19 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"rocknroll_004.wav"')
            a20 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"metal_000.wav"')
            a21 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"metal_001.wav"')
            a22 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"metal_002.wav"')
            a23 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"metal_003.wav"')
            a24 = str2double(temp_3(10))- zero;
        end
        
        if strcmp(temp_3(5), '"metal_004.wav"')
            a25 = str2double(temp_3(10))- zero;
        end
        
    
    end
    
    onsets = [a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25] ;
    onsets=num2cell(onsets,1);
    
    savename=sprintf('dm_run%d.mat', j);
    
    save(savename, 'names', 'durations', 'onsets');

    fclose(fid);
end

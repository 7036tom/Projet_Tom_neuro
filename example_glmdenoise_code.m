nRuns = 8
thisSubjectMeta = 'Subj1'


path_subj_i = 'path_to_be_replaced/'
analysis_dir = fullfile(path_subj_i,'Output_glm_denoise')

epiDirs=cell(1,nRuns);
        for runI=1:nRuns            
            epiDirs{runI} = fullfile(path_subj_i, sprintf('run%d',runI+4));       
        end%for runI=1:thisNruns
        
       
        
        %files= get_files(epiDirs{:},'wvol0*.nii')
        
        
        
        %files = get_files(epiDirs,'wvol0*.nii');% mean EPI image
        %size(files)
        % the stimuli were on screen for 6 sec
        % the TR was 2 secs
        stimdur=6;tr=2;
        % because our onsets were not necessarily right on Volume acquisition
        % we need to assume the standard HRF function
        hrfmodel= 'optimize'%'optimize';
        % we will adopt the strategy of assuming a fixed HRF
        % in the analysis of each run.  Here we compute a canonical HRF.        
        
        nConditions=25;        
        
        logfile_dir = path_subj_i;
        
        ts_dir = fullfile(path_subj_i, 'ts_glm_denoise');
        %check_dir(ts_dir,0);

        ts = fullfile(ts_dir,'timeseries.mat');
        if (1 ==1 || ~exist(ts,'file'))
            
            
            fprintf('*** Reading volumes for subject %s ***\n',thisSubjectMeta);
            
            data=cell(1,nRuns);
            % fetch the epi volumes
            for runI=1:nRuns
                
                files= get_files(epiDirs{runI},'wvol0*.nii'); % ADDED
                
                % load the epi
                %files(2, :)
                %files(1, :)
                thisSessionY=single(spm_read_vols(spm_vol(files(:,:))));
                % store in data cell
                data{runI}=thisSessionY;
                fprintf('*** read in run no. %s out of %s runs ***\n',num2str(runI),num2str(nRuns));
            end
            clear thisSessionY
            save(ts,'data','-v7');
            nVolumes = size(data{1},4);           
        %else 
        %   fprintf('*** reading in time-series data for %s ***\n',thisSubjectMeta);
        %    a=load(ts);
        %    data=a.data;clear a;
        %    nVolumes = size(data{1},4)
        %    nRuns = numel(data);
        end
            
        fprintf('*** reading in log files for %s and making design matrix ***\n',thisSubjectMeta);
        design = cell(1,nRuns);
        
        size(data{1})
        for runI=1:nRuns 
            
            tempOnsets=cell(1,nConditions);
            
            %fileName_names=fullfile(logfile_dir,sprintf('log_%s_run%d_names.txt',thisSubjectMeta,runI));
            fileName_onsets=fullfile(logfile_dir,sprintf('log_%s_run%d_onsets.txt',thisSubjectMeta,runI+4)); 
            
            %names = importdata(fileName_names); % importfile
            onsets = importdata(fileName_onsets); % importfile
            
            
            
            
         
            % log(:,5) = names
            % log(:,6) = onsets
            
            starttime = round(onsets);
                
            for condI=1:nConditions
                tempOnsets{condI}=starttime(condI);              
            end
            
            % paperclips
            % tempOnsets{nConditions+1}=starttime(names==88);
            
            
            design{runI} = zeros(nVolumes,nConditions);
            for condI=1:nConditions
                design{runI}(tempOnsets{condI}/2+1, condI)= 1;
            end  
            
            size(design)
        end
        
      
  
        fprintf('*** estimating beta parameters for %s ***\n',thisSubjectMeta);
        % run glm denoise with denoising
        [results, denoiseddata] = GLMdenoisedata(design,data,stimdur,tr, ...
            hrfmodel,[],struct('numboots',50,'numpcstotry',20,'wantparametric',1), ...
            analysis_dir);
        
        



        modelmd = results.modelmd{2}(:,:,:,1:nConditions);
        modelse = results.modelse{2}(:,:,:,1:nConditions);
        poolse = sqrt(mean(modelse.^2,4));
        %modelmd = bsxfun(@rdivide,modelmd,poolse);

        % save a local copy in the subject's folder
        filename = fullfile(analysis_dir,'glmdenoiseEstimates.mat');
        save(filename,'results','modelmd','poolse','-v7.3');

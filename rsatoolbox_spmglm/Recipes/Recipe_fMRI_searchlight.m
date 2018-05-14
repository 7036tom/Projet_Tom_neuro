% Recipe_fMRI_searchlight
%
% Cai Wingfield 11-2009, 2-2010, 3-2010, 8-2010
%__________________________________________________________________________
% Copyright (C) 2010 Medical Research Council

%%%%%%%%%%%%%%%%%%%%
%% Initialisation %%
%%%%%%%%%%%%%%%%%%%%

toolboxRoot = 'toolboxPathOnYourMachine'; addpath(genpath(toolboxRoot)); % Catch sight of the toolbox code
userOptions = defineUserOptions();

%%%%%%%%%%%%%%%%%%%%%%
%% Data preparation %%
%%%%%%%%%%%%%%%%%%%%%%

fullBrainVols = fMRIDataPreparation('SPM', userOptions);
binaryMasks_nS = fMRIMaskPreparation(userOptions);

%%%%%%%%%%%%%%%%%%%%%
%% RDM calculation %%
%%%%%%%%%%%%%%%%%%%%%

%models = constructModelRDMs(modeltest5x5(), userOptions);
%disp('start')
%disp(size(models))

model_C1.RDM=C_RDM_1
model_C1.name='modelC1'
model_C1.color='red'

model_C2.RDM=C_RDM_2
model_C2.name='modelC2'
model_C2.color='red'

model_C3.RDM=C_RDM_3
model_C3.name='modelC3'
model_C3.color='red'

model_C4.RDM=C_RDM_4
model_C4.name='modelC4'
model_C4.color='red'

model_C5.RDM=C_RDM_5
model_C5.name='modelC5'
model_C5.color='red'

model_C6.RDM=C_RDM_6
model_C6.name='modelC6'
model_C6.color='red'

model_C7.RDM=C_RDM_7
model_C7.name='modelC7'
model_C7.color='red'



models = [model_C1, model_C2, model_C3, model_C4, model_C5, model_C6, model_C7]
%%%%%%%%%%%%%%%%%
%% Searchlight %%
%%%%%%%%%%%%%%%%%

fMRISearchlight(fullBrainVols, binaryMasks_nS, models, 'SPM', userOptions);

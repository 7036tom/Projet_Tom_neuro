% Recipe_fMRI
% this 'recipe' performs region of interest analysis on fMRI data.
% Cai Wingfield 5-2010, 6-2010, 7-2010, 8-2010
%__________________________________________________________________________
% Copyright (C) 2010 Medical Research Council

%%%%%%%%%%%%%%%%%%%%
%% Initialisation %%
%%%%%%%%%%%%%%%%%%%%

toolboxRoot = 'toolboxPathOnYourMachine'; addpath(genpath(toolboxRoot));
userOptions = defineUserOptions();

%%%%%%%%%%%%%%%%%%%%%%
%% Data preparation %%
%%%%%%%%%%%%%%%%%%%%%%

fullBrainVols = fMRIDataPreparation('mat', userOptions);
binaryMasks_nS = fMRIMaskPreparation(userOptions);
responsePatterns = fMRIDataMasking(fullBrainVols, binaryMasks_nS, 'mat', userOptions);



%%%%%%%%%%%%%%%%%%%%%
%% RDM calculation %%
%%%%%%%%%%%%%%%%%%%%%

RDMs = constructRDMs(responsePatterns, 'mat', userOptions);
sRDMs = averageRDMs_subjectSession(RDMs, 'session');
RDMs = averageRDMs_subjectSession(RDMs, 'session', 'subject');


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

%model_C6.RDM=C_RDM_6
%model_C6.name='modelC6'
%model_C6.color='red'

%model_C7.RDM=C_RDM_7
%model_C7.name='modelC7'
%model_C7.color='red'



Models = [model_C1, model_C2, model_C3, model_C4, model_C5]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% First-order visualisation %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figureRDMs(RDMs, userOptions, struct('fileName', 'RoIRDMs', 'figureNumber', 1));
figureRDMs(Models, userOptions, struct('fileName', 'ModelRDMs', 'figureNumber', 2));

MDSConditions(RDMs, userOptions);
dendrogramConditions(RDMs, userOptions);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% relationship amongst multiple RDMs %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pairwiseCorrelateRDMs({RDMs, Models}, userOptions);
MDSRDMs({RDMs, Models}, userOptions);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% statistical inference %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
roiIndex = 1;% index of the ROI for which the group average RDM will serve 
% as the reference RDM. 
for i=1:numel(Models)
    models{i}=Models(i);
end
userOptions.RDMcorrelationType='Kendall_taua';
userOptions.RDMrelatednessTest = 'subjectRFXsignedRank';
userOptions.RDMrelatednessThreshold = 0.05;
userOptions.figureIndex = [10 11];
userOptions.RDMrelatednessMultipleTesting = 'FDR';
userOptions.candRDMdifferencesTest = 'subjectRFXsignedRank';
userOptions.candRDMdifferencesThreshold = 0.05;
userOptions.candRDMdifferencesMultipleTesting = 'none';
stats_p_r=compareRefRDM2candRDMs(RDMs(roiIndex), models, userOptions);

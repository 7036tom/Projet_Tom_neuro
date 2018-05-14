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

fullBrainVols = fMRIDataPreparation('SPM', userOptions);
binaryMasks_nS = fMRIMaskPreparation(userOptions);
responsePatterns = fMRIDataMasking(fullBrainVols, binaryMasks_nS, 'SPM', userOptions);



%%%%%%%%%%%%%%%%%%%%%
%% RDM calculation %%
%%%%%%%%%%%%%%%%%%%%%

RDMs = constructRDMs(responsePatterns, 'SPM', userOptions);
sRDMs = averageRDMs_subjectSession(RDMs, 'session');
RDMs = averageRDMs_subjectSession(RDMs, 'session', 'subject');

% A COMPLETER (important : matrice(s) candidate(s), une dsm et un nom. La couleur n'a pas d'importance)
model_test.RDM=C_RDM_7
model_test.name='modeltest'
model_test.color='red'

Models = model_test
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

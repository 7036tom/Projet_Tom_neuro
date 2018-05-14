function userOptions = defineUserOptions()
%
%  projectOptions is a nullary function which initialises a struct
%  containing the preferences and details for a particular project.
%  It should be edited to taste before a project is run, and a new
%  one created for each substantially different project (though the
%  options struct will be saved each time the project is run under
%  a new name, so all will not be lost if you don't do this).
%
%  For a guide to how to fill out the fields in this file, consult
%  the documentation folder (particularly the userOptions_guide.m)
%
%  Cai Wingfield 11-2009
%__________________________________________________________________________
% Copyright (C) 2009 Medical Research Council


%% Project details


userOptions.projectName = 'glm' % A COMPLETER (aucune importance)

% This name identifies a collection of files which all belong to the same run of a project.
% A COMPLETER (aucune importance)
userOptions.analysisName = 'AllS_mean';

% A COMPLETER (important : prealablement creer un dossier qui contiendra le projet, et indiquer ici le lien vers ce dossier.)
% This is the root directory of the project.
userOptions.rootPath ='/hpc/banco/dagens.t/Project_AllS_mean/';

%A COMPLETER (important : indiquer ici le lien vers les Betas issues de glm denoise )
% The path leading to where the scans are stored (not including subject-specific identifiers).
% "[[subjectName]]" should be used as a placeholder to denote an entry in userOptions.subjectNames
% "[[betaIdentifier]]" should be used as a placeholder to denote an output of betaCorrespondence.m if SPM is not being used; or an arbitrary filename if SPM is being used.
userOptions.betaPath = '/hpc/banco/dagens.t/[[subjectName]]/Beta_maps_25x25/[[betaIdentifier]]';% e.g. /imaging/mb01/lexpro/multivariate/ffx_simple/[[subjectName]]/[[betaIdentifier]]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FEATUERS OF INTEREST SELECTION OPTIONS %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%% %% %% %% %%
	%% fMRI  %% Use these next three options if you're working in fMRI native space:
	%% %% %% %% %%
	
    
    % A COMPLETER (important : indiquer ici le chemin vers un dossier contenant au moins un masque, ce mask pouvant etre celui obtenu par estimation (spm fmri) de la SPM.mat obtenue grace a spm glm. (ie tout le volume cerebral) 
	% The path to a stereotypical mask data file is stored (not including subject-specific identifiers).
	% "[[subjectName]]" should be used as a placeholder to denote an entry in userOptions.subjectNames
	% "[[maskName]]" should be used as a placeholder to denote an entry in userOptions.maskNames
	userOptions.maskPath = '/hpc/banco/dagens.t/[[subjectName]]/Beta_maps_25x25/[[maskName]].img';%'/imaging/mb01/lexpro/multivariate/ffx_simple/[[subjectName]]/[[maskName]].img';
	
    % A COMPLETER (important : les noms des masques (sans l'extension, qui doit etre .hdr/.img))
    % The list of mask filenames (minus .hdr extension) to be used.
    userOptions.maskNames = { ...
	'mask03',...
	};

%%%%%%%%%%%%%%%%%%%%%%%%%
%% SEARCHLIGHT OPTIONS %%
%%%%%%%%%%%%%%%%%%%%%%%%%

	%% %% %% %% %%
	%% fMRI  %% Use these next three options if you're working in fMRI native space:
	%% %% %% %% %%

		% What is the path to the anatomical (structural) fMRI scans for each subject?
		% "[[subjectName]]" should be used to denote an entry in userOptions.subjectNames
		%userOptions.structuralsPath = 'hpc/banco/dagens.t/Subj1/Anat/ ';% e.g. /imaging/mb01/lexpro/[[subjectName]]/structurals/
        
        % A COMPLETER (imortant : taille des voxels de l'etude (standard : 2mm))
		% What are the dimensions (in mm) of the voxels in the scans?
		userOptions.voxelSize = [1.4 1.4 1.4];	
        
        % A COMPLETER
		% What radius of searchlight should be used (mm)?
		userOptions.searchlightRadius = 5;
	
%%%%%%%%%%%%%%%%%%%%%%%%
%% EXPERIMENTAL SETUP %%
%%%%%%%%%%%%%%%%%%%%%%%%

% A COMPLETER (Important dans le cadre de spm glm si l'on se sert de la wildcard [[Subject]] pour traiter plusieurs sujets ? la fois, auquel cas il est necessaire d'indiquer ici les noms donn?s aux differents sujets)
% The list of subjects to be included in the study.
userOptions.subjectNames = {'Subj1'}; %eg CBUXXXXX

% The default colour label for RDMs corresponding to RoI masks (as opposed to models).
userOptions.RoIColor = [0 0 1];
userOptions.ModelColor = [0 1 0];

% Should information about the experimental design be automatically acquired from SPM metadata?
% If this option is set to true, the entries in userOptions.conditionLabels MUST correspond to the names of the conditions as specified in SPM.
userOptions.getSPMData = true;

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSIS PREFERENCES %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%% First-order analysis

% Text lables which may be attached to the conditions for MDS plots.
%[userOptions.conditionLabels{1:5}] = deal(' ');

% A COMPLETER (important : il faut fournir les meme noms que ceux choisis dans la definition des design matrix, ie les suivants)
userOptions.conditionLabels = {'ambient1', 'ambient2', 'ambient3', 'ambient4', 'ambient5', 'symphonic1', 'symphonic2', 'symphonic3', 'symphonic4', 'symphonic5', 'country1', 'country2', 'country3', 'country4', 'country5', 'rocknroll1', 'rocknroll2', 'rocknroll3', 'rocknroll4', 'rocknroll5', 'metal1', 'metal2', 'metal3', 'metal4', 'metal5'} ;

%userOptions.alternativeConditionLabels = { ...
% 	'ambient', ...
% 	'symphonic', ...
% 	'country', ...
% 	'rocknroll', ...
% 	'metal' ...
% 	};
% userOptions.useAlternativeConditionLabels = true;

% What colours should be given to the conditions?
userOptions.conditionColours = [repmat([1 0 0], 48,1); repmat([0 0 1], 44,1)];

% Which distance measure to use when calculating first-order RDMs.
userOptions.distance = 'Correlation';

%% Second-order analysis

% Which similarity-measure is used for the second-order comparison.
userOptions.distanceMeasure = 'Spearman';

% How many permutations should be used to test the significance of the fits?  (10,000 highly recommended.)
userOptions.significanceTestPermutations = 10000;

% Bootstrap options
userOptions.nResamplings = 1000;
userOptions.resampleSubjects = true;
userOptions.resampleConditions = false;

% Should RDMs' entries be rank transformed into [0,1] before they're displayed?
userOptions.rankTransform = false;

% Should rubber bands be shown on the MDS plot?
userOptions.rubberbands = true;

% What criterion shoud be minimised in MDS display?
userOptions.criterion = 'metricstress';

% What is the colourscheme for the RDMs?
userOptions.colourScheme = bone(128);

% How should figures be outputted?
userOptions.displayFigures = false;
userOptions.saveFiguresPDF = true;
userOptions.saveFiguresFig = false;
userOptions.saveFiguresPS = false;
% Which dots per inch resolution do we output?
userOptions.dpi = 300;
% Remove whitespace from PDF/PS files?
% Bad if you just want to print the figures since they'll
% no longer be A4 size, good if you want to put the figure
% in a manuscript or presentation.
userOptions.tightInset = false;

userOptions.forcePromptReply = 'r';
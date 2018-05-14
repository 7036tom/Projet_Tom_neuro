function betas = betaCorrespondence();
%
%  betaCorrespondence.m is a simple function which should combine
%  three things: preBeta:	a string which is at the start of each file
%  containing a beta image, betas:	a struct indexed by (session,
%  condition) containing a sting unique to each beta image, postBeta:	a
%  string which is at the end of each file containing a beta image, not
%  containing the file .suffix
% 
%  use "[[subjectName]]" as a placeholder for the subject's name as found
%  in userOptions.subjectNames if necessary For example, in an experment
%  where the data from subject1 (subject1 name)  is saved in the format:
%  subject1Name_session1_condition1_experiment1.img and similarly for the
%  other conditions, one could use this function to define a general
%  mapping from experimental conditions to the path where the brain
%  responses are stored. If the paths are defined for a general subject,
%  the term [[subjectName]] would be iteratively replaced by the subject
%  names as defined by userOptions.subjectNames.
% 
%  note that this function could be replaced by an explicit mapping from
%  experimental conditions and sessions to data paths.
% 
%  Cai Wingfield 1-2010
%__________________________________________________________________________
% Copyright (C) 2010 Medical Research Council

preBeta = 'Beta_';

% betas(session, condition).identifier = ???
  
betas(1,1).identifier = '0001';
betas(1,2).identifier = '0002';
betas(1,3).identifier = '0003';
betas(1,4).identifier = '0004';
betas(1,5).identifier = '0005';
betas(1,6).identifier = '0006';
betas(1,7).identifier = '0007';
betas(1,8).identifier = '0008';
betas(1,9).identifier = '0009';
betas(1,10).identifier = '0010';
betas(1,11).identifier = '0011';
betas(1,12).identifier = '0012';
betas(1,13).identifier = '0013';
betas(1,14).identifier = '0014';
betas(1,15).identifier = '0015';
betas(1,16).identifier = '0016';
betas(1,17).identifier = '0017';
betas(1,18).identifier = '0018';
betas(1,19).identifier = '0019';
betas(1,20).identifier = '0020';
betas(1,21).identifier = '0021';
betas(1,22).identifier = '0022';
betas(1,23).identifier = '0023';
betas(1,24).identifier = '0024';
betas(1,25).identifier = '0025';





% betas(1,6).identifier = 'session1_condition6';
% betas(1,7).identifier = 'session1_condition7';
% betas(1,8).identifier = 'session1_condition8';

postBeta = '';

for session = 1:size(betas,1)
	for condition = 1:size(betas,2)
		betas(session,condition).identifier = [preBeta betas(session,condition).identifier postBeta];
	end%for
end%for
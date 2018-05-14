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

preBeta = 'beta_';

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

betas(2,1).identifier = '0033';
betas(2,2).identifier = '0034';
betas(2,3).identifier = '0035';
betas(2,4).identifier = '0036';
betas(2,5).identifier = '0037';
betas(2,6).identifier = '0038';
betas(2,7).identifier = '0039';
betas(2,8).identifier = '0040';
betas(2,9).identifier = '0041';
betas(2,10).identifier = '0042';
betas(2,11).identifier = '0043';
betas(2,12).identifier = '0044';
betas(2,13).identifier = '0045';
betas(2,14).identifier = '0046';
betas(2,15).identifier = '0047';
betas(2,16).identifier = '0048';
betas(2,17).identifier = '0049';
betas(2,18).identifier = '0050';
betas(2,19).identifier = '0051';
betas(2,20).identifier = '0052';
betas(2,21).identifier = '0053';
betas(2,22).identifier = '0054';
betas(2,23).identifier = '0055';
betas(2,24).identifier = '0056';
betas(2,25).identifier = '0057';

betas(3,1).identifier = '0065';
betas(3,2).identifier = '0066';
betas(3,3).identifier = '0067';
betas(3,4).identifier = '0068';
betas(3,5).identifier = '0069';
betas(3,6).identifier = '0070';
betas(3,7).identifier = '0077';
betas(3,8).identifier = '0072';
betas(3,9).identifier = '0073';
betas(3,10).identifier = '0074';
betas(3,11).identifier = '0075';
betas(3,12).identifier = '0076';
betas(3,13).identifier = '0077';
betas(3,14).identifier = '0078';
betas(3,15).identifier = '0079';
betas(3,16).identifier = '0080';
betas(3,17).identifier = '0081';
betas(3,18).identifier = '0082';
betas(3,19).identifier = '0083';
betas(3,20).identifier = '0084';
betas(3,21).identifier = '0085';
betas(3,22).identifier = '0086';
betas(3,23).identifier = '0087';
betas(3,24).identifier = '0088';
betas(3,25).identifier = '0089';

betas(4,1).identifier = '0097';
betas(4,2).identifier = '0098';
betas(4,3).identifier = '0099';
betas(4,4).identifier = '0100';
betas(4,5).identifier = '0101';
betas(4,6).identifier = '0102';
betas(4,7).identifier = '0103';
betas(4,8).identifier = '0104';
betas(4,9).identifier = '0105';
betas(4,10).identifier = '0106';
betas(4,11).identifier = '0107';
betas(4,12).identifier = '0108';
betas(4,13).identifier = '0109';
betas(4,14).identifier = '0110';
betas(4,15).identifier = '0111';
betas(4,16).identifier = '0112';
betas(4,17).identifier = '0113';
betas(4,18).identifier = '0114';
betas(4,19).identifier = '0115';
betas(4,20).identifier = '0116';
betas(4,21).identifier = '0117';
betas(4,22).identifier = '0118';
betas(4,23).identifier = '0119';
betas(4,24).identifier = '0120';
betas(4,25).identifier = '0121';

betas(5,1).identifier = '0129';
betas(5,2).identifier = '0130';
betas(5,3).identifier = '0131';
betas(5,4).identifier = '0132';
betas(5,5).identifier = '0133';
betas(5,6).identifier = '0134';
betas(5,7).identifier = '0135';
betas(5,8).identifier = '0136';
betas(5,9).identifier = '0137';
betas(5,10).identifier = '0138';
betas(5,11).identifier = '0139';
betas(5,12).identifier = '0140';
betas(5,13).identifier = '0141';
betas(5,14).identifier = '0142';
betas(5,15).identifier = '0143';
betas(5,16).identifier = '0144';
betas(5,17).identifier = '0145';
betas(5,18).identifier = '0146';
betas(5,19).identifier = '0147';
betas(5,20).identifier = '0148';
betas(5,21).identifier = '0149';
betas(5,22).identifier = '0150';
betas(5,23).identifier = '0151';
betas(5,24).identifier = '0152';
betas(5,25).identifier = '0153';

betas(6,1).identifier = '0161';
betas(6,2).identifier = '0162';
betas(6,3).identifier = '0163';
betas(6,4).identifier = '0164';
betas(6,5).identifier = '0165';
betas(6,6).identifier = '0166';
betas(6,7).identifier = '0167';
betas(6,8).identifier = '0168';
betas(6,9).identifier = '0169';
betas(6,10).identifier = '0170';
betas(6,11).identifier = '0171';
betas(6,12).identifier = '0172';
betas(6,13).identifier = '0173';
betas(6,14).identifier = '0174';
betas(6,15).identifier = '0175';
betas(6,16).identifier = '0176';
betas(6,17).identifier = '0177';
betas(6,18).identifier = '0178';
betas(6,19).identifier = '0179';
betas(6,20).identifier = '0180';
betas(6,21).identifier = '0181';
betas(6,22).identifier = '0182';
betas(6,23).identifier = '0183';
betas(6,24).identifier = '0184';
betas(6,25).identifier = '0185';

betas(7,1).identifier = '0193';
betas(7,2).identifier = '0194';
betas(7,3).identifier = '0195';
betas(7,4).identifier = '0196';
betas(7,5).identifier = '0197';
betas(7,6).identifier = '0198';
betas(7,7).identifier = '0199';
betas(7,8).identifier = '0200';
betas(7,9).identifier = '0201';
betas(7,10).identifier = '0202';
betas(7,11).identifier = '0203';
betas(7,12).identifier = '0204';
betas(7,13).identifier = '0205';
betas(7,14).identifier = '0206';
betas(7,15).identifier = '0207';
betas(7,16).identifier = '0208';
betas(7,17).identifier = '0209';
betas(7,18).identifier = '0210';
betas(7,19).identifier = '0211';
betas(7,20).identifier = '0212';
betas(7,21).identifier = '0213';
betas(7,22).identifier = '0214';
betas(7,23).identifier = '0215';
betas(7,24).identifier = '0216';
betas(7,25).identifier = '0217';

betas(8,1).identifier = '0225';
betas(8,2).identifier = '0226';
betas(8,3).identifier = '0227';
betas(8,4).identifier = '0228';
betas(8,5).identifier = '0229';
betas(8,6).identifier = '0230';
betas(8,7).identifier = '0231';
betas(8,8).identifier = '0232';
betas(8,9).identifier = '0233';
betas(8,10).identifier = '0234';
betas(8,11).identifier = '0235';
betas(8,12).identifier = '0236';
betas(8,13).identifier = '0237';
betas(8,14).identifier = '0238';
betas(8,15).identifier = '0239';
betas(8,16).identifier = '0240';
betas(8,17).identifier = '0241';
betas(8,18).identifier = '0242';
betas(8,19).identifier = '0243';
betas(8,20).identifier = '0244';
betas(8,21).identifier = '0245';
betas(8,22).identifier = '0246';
betas(8,23).identifier = '0247';
betas(8,24).identifier = '0248';
betas(8,25).identifier = '0249';



% betas(1,6).identifier = 'session1_condition6';
% betas(1,7).identifier = 'session1_condition7';
% betas(1,8).identifier = 'session1_condition8';

postBeta = '';

for session = 1:size(betas,1)
	for condition = 1:size(betas,2)
		betas(session,condition).identifier = [preBeta betas(session,condition).identifier postBeta];
	end%for
end%for
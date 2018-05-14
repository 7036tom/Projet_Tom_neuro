%  modelRDMs is a user-editable function which specifies the models which
%  brain-region RDMs should be compared to, and which specifies which kinds of
%  analysis should be performed.
%
%  Models should be stored in the "Models" struct as a single field labeled
%  with the model's name (use underscores in stead of spaces).
%  
%  Cai Wingfield 11-2009

function Models = modeltest()
% 
Models.main_clusters = kron([
			0 0 1 1 1
			0 0 1 1 1
			1 1 0 0 0
			1 1 0 0 0
            1 1 0 0 0], ones(10,10));
% Models.random = squareform(pdist(rand(40,40)));